#include <tum_ics_ur10_controller_tutorial/jointspace_controller_1.h>

#include <tum_ics_ur_robot_msgs/ControlData.h>
#include <control_core/math.h>
#include <control_core/types.h>



namespace tum_ics_ur_robot_lli
{
  namespace RobotControllers
  {

    Vector3d ke(Quaterniond dk);
    void vis_pose(Quaterniond Q, Vector3d X, std::string id, ros::Publisher pub);
    void vis_trajectory(Vector3d v, std::string id, ros::Publisher pub);
    Vector3d circular_offset(double t);
    bool is_all_less(Vector6d a, double range);
    Vector3d circular_offset_speed(double t);


    JointSpaceController_1::JointSpaceController_1(double weight, const QString &name) : 
      ControlEffort(name, SPLINE_TYPE, JOINT_SPACE, weight),
      startFlag_(false),
      model_("ur10_model"),
      qKp_(Matrix6d::Zero()),
      qKd_(Matrix6d::Zero()),
      qKi_(Matrix6d::Zero()),
      xKp_(Matrix6d::Zero()),
      xKd_(Matrix6d::Zero()),
      xKi_(Matrix6d::Zero()),
      q_gamma_(0.0),
      x_gamma_(0.0),
      q_goal_(Vector6d::Zero()),
      x_goal_(Vector3d::Zero()),
      totalTime_(100.0),
      Qinit_(Vector6d::Zero()),
      start_orientation_(Matrix3d::Zero()),
      start_position_(Vector3d::Zero()),
      impedance_is_on(false),
      L_(Vector12d::Zero()),
      I_(Matrix6d::Zero()),
      g_(Vector3d::Zero()),
      masses_(Vector6d::Zero()),
      DeltaQi_(Vector6d::Zero()),
      DeltaQ_(Vector6d::Zero()),
      DeltaQp_(Vector6d::Zero()),
      DeltaXi_(Vector6d::Zero()),
      DeltaX_(Vector6d::Zero()),
      DeltaXp_(Vector6d::Zero()),
      target_pos_(Vector3d::Zero()),
      target_id_(0),
      tracking_start_time_(0),
      id_changed_(false),
      neg_impadace_flank(false),
      imp_Kp_v_(Matrix3d::Zero()),
      imp_Kd_v_(Matrix3d::Zero()),
      imp_Kp_w_(Matrix3d::Zero()),
      imp_Kd_w_(Matrix3d::Zero()),
      rad_influence_(0),
      fac_(0)
    {
      // Publishers
      control_data_pub_ = nh_.advertise<tum_ics_ur_robot_msgs::ControlData>("joint_space_control_data", 1);
      vis_pub_ef = nh_.advertise<geometry_msgs::PoseStamped>( "my_ef2", 1);
      vis_pub_d = nh_.advertise<geometry_msgs::PoseStamped>( "my_destination2", 1 );
      vis_pub_m = nh_.advertise<geometry_msgs::PoseStamped>( "my_marker", 1 );
      vis_pub_circle = nh_.advertise<geometry_msgs::PoseArray>( "my_circle", 1 );
      vis_pub_obstacle = nh_.advertise<geometry_msgs::PoseStamped>( "my_obstacle", 1 );
      plot_pub_joint_errors = nh_.advertise<sensor_msgs::JointState>( "my_joint_errors", 1 );
      plot_pub_joint_dest = nh_.advertise<sensor_msgs::JointState>( "my_joint_dest", 1 );
      plot_pub_pose_errors = nh_.advertise<sensor_msgs::JointState>( "my_pose_errors", 1 );
      plot_pub_pose_dest_x = nh_.advertise<geometry_msgs::PoseStamped>( "my_pose_dest_x", 1 );
      plot_pub_pose_dest = nh_.advertise<sensor_msgs::JointState>( "my_pose_dest", 1 );
      plot_pub_pose_x = nh_.advertise<geometry_msgs::PoseStamped>( "my_pose_x", 1 );
      plot_pub_pose = nh_.advertise<sensor_msgs::JointState>( "my_pose", 1 );

      // Subscribers
      marker_sub = nh_.subscribe("/target", 1000, &JointSpaceController_1::marker_sub_callback, this);
      obstacle_sub = nh_.subscribe("/obstacles", 1000, &JointSpaceController_1::obstacle_sub_callback, this);

      if(!model_.initRequest(nh_))
      {
        ROS_ERROR_STREAM("Error: initalizing model failed!");
      }

      // Gravity
      double gx = 0;
      double gy = 0;
      double gz = 9.81;
      
      g_ << gx, gy, gz;

      //Pie
      double pi = M_PI;
  
      // Initalize the robots parameter vector
      Theta_ = model_.parameterInitalGuess(); 
      Theta_hat_ = Theta_;
    }

    JointSpaceController_1::~JointSpaceController_1()
    {
    }

    void JointSpaceController_1::setQInit(const JointState &qinit)
    {
      qInit_ = qinit;
    }
    void JointSpaceController_1::setQHome(const JointState &qhome)
    {
      qHome_ = qhome;
    }
    void JointSpaceController_1::setQPark(const JointState &qpark)
    {
      qPark_ = qpark;
    }

    bool JointSpaceController_1::start()
    {
      ROS_WARN_STREAM("JointSpaceController_1::start");
      return true;
    }

    bool JointSpaceController_1::stop()
    {
      return true;
    }


    bool JointSpaceController_1::init()
    {
        ROS_WARN_STREAM("JointSpaceController_1::init: loading parameters");

      std::vector<double> vec;

      // check namespace
      std::string ns = "~jointspace_controller";
      if (!ros::param::has(ns))
      {
        ROS_ERROR_STREAM("JointSpaceController_1 init(): Control gains not defined in:" << ns);
        m_error = true;
        return false;
      }

      // ============= Joint control =============

      // GOAL
      ros::param::get(ns + "/q_goal", vec);
      if (vec.size() < STD_DOF)
      {
        ROS_ERROR_STREAM("q_goal: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < STD_DOF; i++)
      {
        q_goal_(i) = vec[i];
      }

      // D GAINS
      ros::param::get(ns + "/q_gains_d", vec);
      if (vec.size() < STD_DOF)
      {
        ROS_ERROR_STREAM("q_gains_d: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (size_t i = 0; i < STD_DOF; i++)
      {
        qKd_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("qKd: \n" << qKd_);

      // P GAINS
      ros::param::get(ns + "/q_gains_p", vec);
      if (vec.size() < STD_DOF)
      {
        ROS_ERROR_STREAM("q_gains_p: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < STD_DOF; i++)
      {
        qKp_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("qKp: \n" << qKp_);

      // I GAINS
      ros::param::get(ns + "/q_gains_i", vec);
      if (vec.size() < STD_DOF)
      {
        ROS_ERROR_STREAM("q_gains_i: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < STD_DOF; i++)
      {
        qKi_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("qKi: \n" << qKi_);

      ros::param::get(ns + "/q_gamma", vec);
      q_gamma_ = vec[0];
      ROS_WARN_STREAM("q_gamma_ : \n" << q_gamma_);

      // ============= Operational control =============

      ros::param::get(ns + "/x_goal", vec);
      if (vec.size() < 3)
      {
        ROS_ERROR_STREAM("x_goal: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < 3; i++)
      {
        x_goal_(i) = vec[i];
      }

      // D GAINS
      ros::param::get(ns + "/x_gains_d", vec);
      if (vec.size() < STD_DOF)
      {
        ROS_ERROR_STREAM("x_gains_d: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (size_t i = 0; i < STD_DOF; i++)
      {
        xKd_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("xKd: \n" << xKd_);

      // P GAINS
      ros::param::get(ns + "/x_gains_p", vec);
      if (vec.size() < STD_DOF)
      {
        ROS_ERROR_STREAM("x_gains_p: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < STD_DOF; i++)
      {
        xKp_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("xKp: \n" << xKp_);

      // I GAINS
      ros::param::get(ns + "/x_gains_i", vec);
      if (vec.size() < STD_DOF)
      {
        ROS_ERROR_STREAM("x_gains_i: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < STD_DOF; i++)
      {
        xKi_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("xKi: \n" << xKi_);

      ros::param::get(ns + "/x_gamma", vec);
      x_gamma_ = vec[0];
      ROS_WARN_STREAM("x_gamma_ : \n" << x_gamma_);

      // ============= Impedance control =============

      // P GAINS
      ros::param::get(ns + "/imp_gains_p_v", vec);
      if (vec.size() < 3)
      {
        ROS_ERROR_STREAM("imp_gains_p_v: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < 3; i++)
      {
        imp_Kp_v_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("imp_Kp_v_: \n" << imp_Kp_v_);

      // D GAINS
      ros::param::get(ns + "/imp_gains_d_v", vec);
      if (vec.size() < 3)
      {
        ROS_ERROR_STREAM("imp_gains_d_v: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < 3; i++)
      {
        imp_Kd_v_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("imp_Kd_v_: \n" << imp_Kd_v_);

      // P GAINS
      ros::param::get(ns + "/imp_gains_p_w", vec);
      if (vec.size() < 3)
      {
        ROS_ERROR_STREAM("imp_gains_p_w: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < 3; i++)
      {
        imp_Kp_w_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("imp_Kp_w_: \n" << imp_Kp_w_);

      // D GAINS
      ros::param::get(ns + "/imp_gains_d_w", vec);
      if (vec.size() < 3)
      {
        ROS_ERROR_STREAM("imp_gains_d_w: wrong number of dimensions:" << vec.size());
        m_error = true;
        return false;
      }
      for (int i = 0; i < 3; i++)
      {
        imp_Kd_w_(i, i) = vec[i];
      }
      ROS_WARN_STREAM("imp_Kd_w_: \n" << imp_Kd_w_);

      ros::param::get(ns + "/rad_influence", vec);
      rad_influence_ = vec[0];
      ROS_WARN_STREAM("rad_influence_ : \n" << rad_influence_);

      ros::param::get(ns + "/fac", vec);
      fac_ = vec[0];
      ROS_WARN_STREAM("fac_ : \n" << fac_);

      // ============= Other parameters =============

      // total time
      ros::param::get(ns + "/time", totalTime_);
      if (!(totalTime_ > 0))
      {
        ROS_ERROR_STREAM("totalTime_: is negative:" << totalTime_);
        totalTime_ = 100.0;
      }
      
      ROS_WARN_STREAM("Goal [DEG]: \n" << q_goal_.transpose());
      ROS_WARN_STREAM("Total Time [s]: " << totalTime_);
      q_goal_ = DEG2RAD(q_goal_);
      ROS_WARN_STREAM("Goal [RAD]: \n" << q_goal_.transpose());

      return true;
    }

    Vector6d JointSpaceController_1::update(const RobotTime &time, const JointState &current) {

      // joint parameters
      double q1 = current.q(0);
      double q2 = current.q(1);
      double q3 = current.q(2);
      double q4 = current.q(3);
      double q5 = current.q(4);
      double q6 = current.q(5);

      Vector6d Q; 
      Q << q1, q2 ,q3, q4, q5, q6;

      double qp1 = current.qp(0);
      double qp2 = current.qp(1);
      double qp3 = current.qp(2);
      double qp4 = current.qp(3);
      double qp5 = current.qp(4);
      double qp6 = current.qp(5);

      Vector6d Qp;
      Qp << qp1, qp2 ,qp3, qp4, qp5, qp6;

      double qpp1 = current.qpp(0);
      double qpp2 = current.qpp(1);
      double qpp3 = current.qpp(2);
      double qpp4 = current.qpp(3);
      double qpp5 = current.qpp(4);
      double qpp6 = current.qpp(5);

      Vector6d Qpp;
      Qpp << qpp1, qpp2 ,qpp3, qpp4, qpp5, qpp6;

      // control torque
      Vector6d tau = Vector6d::Zero();
      if (time.tD() <= 5) {
        tau = joint_control( Q,  Qp,  Qpp,  1, 5, time);
      } else if (time.tD() < totalTime_) {
        tau = operational_control_multi_obstacle_avoidance_and_circular_motion_and_tracking( Q,  Qp,  Qpp,  5, totalTime_, time);
      }

      // publish the ControlData (only for debugging)
      tum_ics_ur_robot_msgs::ControlData msg;
      msg.header.stamp = ros::Time::now();
      msg.time = time.tD();
      for (int i = 0; i < STD_DOF; i++)
      {
        msg.q[i] = current.q(i);
        msg.qp[i] = current.qp(i);
        msg.qpp[i] = current.qpp(i);

        msg.Dq[i] = DeltaQ_(i);
        msg.Dqp[i] = DeltaQp_(i);

        msg.torques[i] = current.tau(i);
      }

      control_data_pub_.publish(msg);

      // publish end-effector pose
      cc::HomogeneousTransformation T_ef = model_.T_ef_0(Q);
      Vector3d ef_v = T_ef.translation();
      Quaterniond ef_k(T_ef.rotation());
      vis_pose(ef_k, ef_v, "dh_arm_joint_0", vis_pub_ef);
      
      return tau;
    }

    // task 1.1, 1.2, 1.3
     Vector6d JointSpaceController_1::operational_control_circular_motion(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {
      
      // time variables
      double t = time.tD() - start_time;

      // orientation goal
      Matrix3d R_goal;
      R_goal << 
            -1, 0, 0,
             0, 1, 0,
             0, 0, -1;
      Quaterniond Q_goal(R_goal);
      
      // save current pose
      if (!startFlag_)
        {
          T_ef_0_start_ = model_.T_ef_0(Q);
          startFlag_ = true;
        }        

      // slerp interpolation
      Quaterniond Q_start(T_ef_0_start_.orientation());
      Quaterniond Qd = Q_start.slerp(std::min(1.0, t/4.0), Q_goal);
      
      // goal position with added circular motion
      Vector3d Xd_v = T_ef_0_start_.position() + circular_offset(t);

      // visualize trajectory
      vis_trajectory(T_ef_0_start_.position(), "dh_arm_joint_0", vis_pub_circle);

      // pose goal
      Vector7d Xd;
      Xd << Xd_v, Qd.coeffs();

      // velocity goal
      Vector6d Xdp;
      Xdp.setZero();

      // accerleration goal
      Vector6d Xdpp;
      Xdpp.setZero();

      // visualize goal pose
      Quaterniond kd(R_goal);
      vis_pose(kd, Xd_v, "dh_arm_joint_0", vis_pub_d);

      // calculate output torque
      return operational_control(Q, Qp, Xd, Xdp, Xdpp);
    }

    // task 2.2
    Vector6d JointSpaceController_1::operational_control_tracking(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {
      
      double t = time.tD() - start_time;

      if (!startFlag_)
      {
        T_ef_0_start_ = model_.T_ef_0(Q);
        start_orientation_ = T_ef_0_start_.orientation();
        tracking_start_time_ = 0;
        startFlag_ = true;
      }   

      if (id_changed_) {
        tracking_start_time_ = time.tD() - start_time;
        start_orientation_ = model_.T_ef_0(Q).orientation();
        id_changed_ = false;
      }
      
      // Orientations
      Quaterniond Q_start(start_orientation_);
      Quaterniond Q_goal = quat_for_marker_tracking(Q);

      // slerp interpolation
      Quaterniond Qd(Quaterniond::Identity());
      Qd = Q_start.slerp(std::min(1.0, (t - tracking_start_time_)/3.0), Q_goal);

      Vector3d Xd_v = T_ef_0_start_.position();

      // postion goal
      Vector7d Xd;
      Xd << Xd_v, Qd.coeffs();

      // velocity goal
      Vector6d Xdp;
      Xdp.setZero();

      // accerleration goal
      Vector6d Xdpp;
      Xdpp.setZero();

      // visualize goal pose
      vis_pose(Q_goal, Xd_v, "dh_arm_joint_0", vis_pub_d);

      // calculate output torque
      return operational_control(Q, Qp, Xd, Xdp, Xdpp);
    }

    // task 2.3, 2.4
    Vector6d JointSpaceController_1::operational_control_tracking_and_circular_motion(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {

      double t = time.tD() - start_time;

      if (!startFlag_)
      {
        T_ef_0_start_ = model_.T_ef_0(Q);
        start_orientation_ = T_ef_0_start_.orientation();
        tracking_start_time_ = 0;
        startFlag_ = true;
      }   

      if (id_changed_) {
        tracking_start_time_ = time.tD() - start_time;
        start_orientation_ = model_.T_ef_0(Q).orientation();
        id_changed_ = false;
      }
      
      // Orientations
      Quaterniond Q_start(start_orientation_);
      Quaterniond Q_goal = quat_for_marker_tracking(Q);

      // slerp interpolation
      Quaterniond Qd(Quaterniond::Identity());
      Qd = Q_start.slerp(std::min(1.0, (t - tracking_start_time_)/3.0), Q_goal);

      // goal position with added circular motion
      Vector3d Xd_v = T_ef_0_start_.position() + circular_offset(t);

      // visualize trajectory
      vis_trajectory(T_ef_0_start_.position(), "dh_arm_joint_0", vis_pub_circle);

      // postion goal
      Vector7d Xd;
      Xd << Xd_v, Qd.coeffs();

      // velocity goal
      Vector6d Xdp;
      Xdp.setZero();

      // accerleration goal
      Vector6d Xdpp;
      Xdpp.setZero();
 
      // visualize goal pose
      vis_pose(Q_goal, Xd_v, "dh_arm_joint_0", vis_pub_d);

      return operational_control(Q, Qp, Xd, Xdp, Xdpp);
    }

    // task 2.5
    // depricated
    Vector6d JointSpaceController_1::operational_control_obstacle_avoidance(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {

      // orientation goal
      Matrix3d R_goal;
      R_goal << 
            -1, 0, 0,
             0, 1, 0,
             0, 0, -1;
      
      double t = time.tD() - start_time;

      if (!startFlag_)
      {
        T_ef_0_start_ = model_.T_ef_0(Q);
        start_orientation_ = T_ef_0_start_.orientation();
        start_position_ = T_ef_0_start_.position();
        tracking_start_time_ = 0;
        startFlag_ = true;
      }   

      if (impedance_is_on) {
        tracking_start_time_ = time.tD() - start_time;
        start_orientation_ = model_.T_ef_0(Q).orientation();
        start_position_ = model_.T_ef_0(Q).position();
        impedance_is_on = false;
      }
      
      // Orientations
      Quaterniond Q_start(start_orientation_);
      Quaterniond Q_goal(R_goal);

      // slerp interpolation
      Quaterniond Qd(Quaterniond::Identity());
      Qd = Q_start.slerp(std::min(1.0, (t - tracking_start_time_)/3.0), Q_goal);
      
      // goal position with added circular motion
      Vector3d goal_position = T_ef_0_start_.position();
      std::vector<Vector3d> out = interpolate_joint2(start_position_, goal_position, 0, 2, (t - tracking_start_time_));

      Vector3d Xd_v = out[0];

      // visualize trajectory
      vis_trajectory(goal_position, "dh_arm_joint_0", vis_pub_circle);

      // pose goal
      Vector7d Xd;
      Xd << Xd_v, Qd.coeffs();

      // velocity goal
      Vector6d Xdp;
      // Xdp.setZero();
      Xdp << out[1], Vector3d::Zero();

      // accerleration goal
      Vector6d Xdpp;
      // Xdpp.setZero();
      Xdpp << out[2], Vector3d::Zero();

      // visualize goal pose
      Quaterniond kd(R_goal);
      vis_pose(kd, Xd_v, "dh_arm_joint_0", vis_pub_d);

      // distances to joints
      Vector6d joint_dist_0;
      joint_dist_0 << distance_to_j_joint(Q, 0, 0).norm(),
                      distance_to_j_joint(Q, 1, 0).norm(),
                      distance_to_j_joint(Q, 2, 0).norm(),
                      distance_to_j_joint(Q, 3, 0).norm(),
                      distance_to_j_joint(Q, 4, 0).norm(),
                      distance_to_j_joint(Q, 5, 0).norm();

      // calculate output torque
      Vector6d tau(Vector6d::Zero());
      if (is_all_less(joint_dist_0, rad_influence_)) {
        tau = impedance_control(Q, Qp, Xd, Xdp);
        impedance_is_on = true;
      } else {
        tau = operational_control(Q, Qp, Xd, Xdp, Xdpp);
      }

      return tau;
    }

    // task 2.6, 2.7
    Vector6d JointSpaceController_1::operational_control_multi_obstacle_avoidance(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {

      // orientation goal
      Matrix3d R_goal;
      R_goal << 
            -1, 0, 0,
             0, 1, 0,
             0, 0, -1;
      
      double t = time.tD() - start_time;

      if (!startFlag_)
      {
        T_ef_0_start_ = model_.T_ef_0(Q);
        start_orientation_ = T_ef_0_start_.orientation();
        start_position_ = T_ef_0_start_.position();
        tracking_start_time_ = 0;
        startFlag_ = true;
      }   

      if (neg_impadace_flank) {
        tracking_start_time_ = time.tD() - start_time;
        start_orientation_ = model_.T_ef_0(Q).orientation();
        start_position_ = model_.T_ef_0(Q).position();
        neg_impadace_flank = false;
      }
      
      // Orientations
      Quaterniond Q_start(start_orientation_);
      Quaterniond Q_goal(R_goal);

      // slerp interpolation
      Quaterniond Qd(Quaterniond::Identity());
      Qd = Q_start.slerp(std::min(1.0, (t - tracking_start_time_)/3.0), Q_goal);
      
      // goal position with added circular motion
      Vector3d goal_position = T_ef_0_start_.position();
      std::vector<Vector3d> out = interpolate_joint2(start_position_, goal_position, 0, 2, (t - tracking_start_time_));

      Vector3d Xd_v = out[0];

      // visualize trajectory
      vis_trajectory(goal_position, "dh_arm_joint_0", vis_pub_circle);

      // pose goal
      Vector7d Xd;
      Xd << Xd_v, Qd.coeffs();

      // velocity goal
      Vector6d Xdp;
      Xdp << out[1], Vector3d::Zero();

      // accerleration goal
      Vector6d Xdpp;
      Xdpp << out[2], Vector3d::Zero();

      // visualize goal pose
      Quaterniond kd(R_goal);
      vis_pose(kd, Xd_v, "dh_arm_joint_0", vis_pub_d);

      // distances to joints
      Eigen::Matrix<double,6,4> joint_distances_0(Eigen::Matrix<double,6,4>::Constant(100));
      for (int j = 0; j < obstacle_poses_.size(); j++) {
        for (int i = 0; i < 6; i++) {
          joint_distances_0(i,j) = distance_to_j_joint(Q, i, j).norm();
        }
      }      
      
      // calculate output torque
      Vector6d tau(Vector6d::Zero());
      if (joint_distances_0.minCoeff() < rad_influence_) {
        if (!impedance_is_on) {
          impedance_is_on = true;
        }
        tau = impedance_control(Q, Qp, Xd, Xdp);
      } else {
        if (impedance_is_on) {
          impedance_is_on = false;
          neg_impadace_flank = true;
        }
        tau = operational_control(Q, Qp, Xd, Xdp, Xdpp);
      }

      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      Vector4d obstacle_pos_w_h;
      obstacle_pos_w_h << obstacle_poses_[0], 1;

      Vector4d obstacle_pos_0_h = T0_w.inverse() * obstacle_pos_w_h;
      Vector3d obstacle_pos_0 = obstacle_pos_0_h.head(3);

      Quaterniond k(Quaterniond::Identity());
      vis_pose(k, obstacle_pos_0, "dh_arm_joint_0", vis_pub_obstacle);

      return tau;
    }

    // task 2.7
    Vector6d JointSpaceController_1::operational_control_multi_obstacle_avoidance_and_circular_motion(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {

      // orientation goal
      Matrix3d R_goal;
      R_goal << 
            -1, 0, 0,
             0, 1, 0,
             0, 0, -1;
      
      double t = time.tD() - start_time;

      if (!startFlag_)
      {
        T_ef_0_start_ = model_.T_ef_0(Q);
        start_orientation_ = T_ef_0_start_.orientation();
        start_position_ = T_ef_0_start_.position();
        tracking_start_time_ = 0;
        startFlag_ = true;
      }   

      if (neg_impadace_flank) {
        tracking_start_time_ = time.tD() - start_time;
        start_orientation_ = model_.T_ef_0(Q).orientation();
        start_position_ = model_.T_ef_0(Q).position();
        neg_impadace_flank = false;
      }
      
      // Orientations
      Quaterniond Q_start(start_orientation_);
      Quaterniond Q_goal(R_goal);

      // slerp interpolation
      Quaterniond Qd(Quaterniond::Identity());
      Qd = Q_start.slerp(std::min(1.0, (t - tracking_start_time_)/3.0), Q_goal);
      
      // goal position with added circular motion
      Vector3d goal_position = T_ef_0_start_.position()  + circular_offset(t);
      std::vector<Vector3d> out = interpolate_joint2(start_position_, goal_position, 0, 2, (t - tracking_start_time_));

      Vector3d Xd_v = out[0];

      // visualize trajectory
      vis_trajectory(T_ef_0_start_.position(), "dh_arm_joint_0", vis_pub_circle);

      // pose goal
      Vector7d Xd;
      Xd << Xd_v, Qd.coeffs();

      // velocity goal
      Vector6d Xdp;
      Xdp << out[1], Vector3d::Zero();

      // accerleration goal
      Vector6d Xdpp;
      Xdpp << out[2], Vector3d::Zero();

      // visualize goal pose
      Quaterniond kd(R_goal);
      vis_pose(kd, Xd_v, "dh_arm_joint_0", vis_pub_d);

      // distances to joints
      Eigen::Matrix<double,6,4> joint_distances_0(Eigen::Matrix<double,6,4>::Constant(100));
      for (int j = 0; j < obstacle_poses_.size(); j++) {
        for (int i = 0; i < 6; i++) {
          joint_distances_0(i,j) = distance_to_j_joint(Q, i, j).norm();
        }
      }      
      
      // calculate output torque
      Vector6d tau(Vector6d::Zero());
      if (joint_distances_0.minCoeff() < rad_influence_) {
        if (!impedance_is_on) {
          impedance_is_on = true;
        }
        tau = impedance_control(Q, Qp, Xd, Xdp);
      } else {
        if (impedance_is_on) {
          impedance_is_on = false;
          neg_impadace_flank = true;
        }
        tau = operational_control(Q, Qp, Xd, Xdp, Xdpp);
      }

      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      Vector4d obstacle_pos_w_h;
      obstacle_pos_w_h << obstacle_poses_[0], 1;

      Vector4d obstacle_pos_0_h = T0_w.inverse() * obstacle_pos_w_h;
      Vector3d obstacle_pos_0 = obstacle_pos_0_h.head(3);

      Quaterniond k(Quaterniond::Identity());
      vis_pose(k, obstacle_pos_0, "dh_arm_joint_0", vis_pub_obstacle);


      return tau;
    }

    // task 2.8
    Vector6d JointSpaceController_1::operational_control_multi_obstacle_avoidance_and_circular_motion_and_tracking(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {
      
      double t = time.tD() - start_time;

      if (!startFlag_)
      {
        T_ef_0_start_ = model_.T_ef_0(Q);
        start_orientation_ = T_ef_0_start_.orientation();
        start_position_ = T_ef_0_start_.position();
        tracking_start_time_ = 0;
        startFlag_ = true;
      }   

      if (neg_impadace_flank) {
        tracking_start_time_ = time.tD() - start_time;
        start_orientation_ = model_.T_ef_0(Q).orientation();
        start_position_ = model_.T_ef_0(Q).position();
        neg_impadace_flank = false;
      }

      if (id_changed_) {
        tracking_start_time_ = time.tD() - start_time;
        start_orientation_ = model_.T_ef_0(Q).orientation();
        id_changed_ = false;
      }
      
      // Orientations
      Quaterniond Q_start(start_orientation_);
      Quaterniond Q_goal = quat_for_marker_tracking_with_current_orientation(Q);
      // Quaterniond Q_goal = quat_for_marker_tracking(Q);


      // slerp interpolation
      Quaterniond Qd(Quaterniond::Identity());
      Qd = Q_start.slerp(std::min(1.0, (t - tracking_start_time_)/3.0), Q_goal);
      
      // goal position with added circular motion
      Vector3d goal_position = T_ef_0_start_.position() + circular_offset(t);
      std::vector<Vector3d> out = interpolate_joint2(start_position_, goal_position, 0, 3, (t - tracking_start_time_));

      Vector3d Xd_v = out[0];
      // Vector3d Xd_v = goal_position;

      // visualize trajectory
      vis_trajectory(T_ef_0_start_.position(), "dh_arm_joint_0", vis_pub_circle);

      // pose goal
      Vector7d Xd;
      Xd << Xd_v, Qd.coeffs();

      // velocity goal
      Vector6d Xdp;
      // Xdp.setZero();
      Xdp << out[1], Vector3d::Zero();

      // accerleration goal
      Vector6d Xdpp;
      // Xdpp.setZero();
      Xdpp << out[2], Vector3d::Zero();

      // visualize goal pose
      vis_pose(Q_goal, Xd_v, "dh_arm_joint_0", vis_pub_d);

      // distances to joints
      Eigen::Matrix<double,6,4> joint_distances_0(Eigen::Matrix<double,6,4>::Constant(100));
      for (int j = 0; j < obstacle_poses_.size(); j++) {
        for (int i = 0; i < 6; i++) {
          joint_distances_0(i,j) = distance_to_j_joint(Q, i, j).norm();
        }
      }      
      
      // calculate output torque
      Vector6d tau(Vector6d::Zero());
      if (joint_distances_0.minCoeff() < rad_influence_) {
        if (!impedance_is_on) {
          impedance_is_on = true;
        }
        tau = impedance_control_with_orientation(Q, Qp, Xd, Xdp);
      } else {
        if (impedance_is_on) {
          impedance_is_on = false;
          neg_impadace_flank = true;
        }
        tau = operational_control(Q, Qp, Xd, Xdp, Xdpp);
      }

      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      Vector4d obstacle_pos_w_h;
      obstacle_pos_w_h << obstacle_poses_[0], 1;

      Vector4d obstacle_pos_0_h = T0_w.inverse() * obstacle_pos_w_h;
      Vector3d obstacle_pos_0 = obstacle_pos_0_h.head(3);

      Quaterniond k(Quaterniond::Identity());
      vis_pose(k, obstacle_pos_0, "dh_arm_joint_0", vis_pub_obstacle);

      return tau;
    }

    
    //Sub and pub functions

    void JointSpaceController_1::marker_sub_callback(const object_msgs::Objects& msg) {
      Vector3d pos;
      pos << msg.objects[0].position.position.x, msg.objects[0].position.position.y, msg.objects[0].position.position.z;
      target_pos_ = pos;
      int id_new = msg.objects[0].id;
      if (target_id_ != id_new) {
        target_id_ = id_new;
        id_changed_ = true;
        ROS_WARN_STREAM("target_id_ : \n" << target_id_);
      }
    }

    void JointSpaceController_1::obstacle_sub_callback(const object_msgs::Objects& msg) {
      
      std::vector<Vector3d> poses;
      for (int i = 0; i < msg.objects.size(); i++) {
        Vector3d pos;
        pos << msg.objects[i].position.position.x, msg.objects[i].position.position.y, msg.objects[i].position.position.z;
        poses.push_back(pos);
      }

      obstacle_poses_ = poses;
      
      // for (int i = 0; i < poses.size(); i++) {
      //   ROS_WARN_STREAM("#" << i);
      //   ROS_WARN_STREAM("posses : \n" << poses[i]);
      // }

    }

    void vis_trajectory(Vector3d v, std::string id, ros::Publisher pub) {
      Quaterniond kc(Quaterniond::Identity());
      geometry_msgs::PoseArray poses_circle;
      poses_circle.header.frame_id = id;
      poses_circle.header.stamp = ros::Time();

      double n = 50;
      for (int i = 0; i < n; i++) {
        
        double t = i*2*3.14/(n * 0.8);
        Vector3d vc = v + circular_offset(t);

        geometry_msgs::Pose pose;
        pose.position.x = vc(0);
        pose.position.y = vc(1);
        pose.position.z = vc(2);
        pose.orientation.w = kc.w();
        pose.orientation.x = kc.x();
        pose.orientation.y = kc.y();
        pose.orientation.z = kc.z();

        poses_circle.poses.push_back(pose);
      }
      pub.publish( poses_circle );
    }

    void vis_pose(Quaterniond Q, Vector3d X, std::string id, ros::Publisher pub) {
      geometry_msgs::PoseStamped pose;
      pose.header.frame_id = id;
      pose.header.stamp = ros::Time();
      pose.pose.position.x = X(0);
      pose.pose.position.y = X(1);
      pose.pose.position.z = X(2);
      pose.pose.orientation.w = Q.w();
      pose.pose.orientation.x = Q.x();
      pose.pose.orientation.y = Q.y();
      pose.pose.orientation.z = Q.z();
      pub.publish( pose );
    }

    void JointSpaceController_1::plot_joint_data(Vector6d dQ, Vector6d dQp, Vector6d dQi, ros::Publisher pub) {
      sensor_msgs::JointState msg;
      msg.header.frame_id = "0";
      msg.header.stamp = ros::Time();

      for (int i = 0; i < 6; i++) {
        msg.name.push_back("Joint " + std::to_string(i+1));
        msg.position.push_back(dQ(i));
        msg.velocity.push_back(dQp(i));
        msg.effort.push_back(dQi(i));
      }

      pub.publish(msg);
    }

    void JointSpaceController_1::plot_pose_data(Vector7d X, Vector6d Xp, Vector6d Xpp, ros::Publisher pub1, ros::Publisher pub2) {
      geometry_msgs::PoseStamped pose;
      pose.header.frame_id = "0";
      pose.header.stamp = ros::Time();
      pose.pose.position.x = X(0);
      pose.pose.position.y = X(1);
      pose.pose.position.z = X(2);
      pose.pose.orientation.w = X(3);
      pose.pose.orientation.x = X(4);
      pose.pose.orientation.y = X(5);
      pose.pose.orientation.z = X(6);
      pub1.publish( pose );

      sensor_msgs::JointState msg;
      msg.header.frame_id = "0";
      msg.header.stamp = ros::Time();


      msg.name.push_back("x");
      msg.name.push_back("y");
      msg.name.push_back("z");
      msg.name.push_back("wx");
      msg.name.push_back("wy");
      msg.name.push_back("wz");

      for (int i = 0; i < 6; i++) {
        msg.position.push_back(0);
        msg.velocity.push_back(Xp(i));
        msg.effort.push_back(Xpp(i));
      }
      
      pub2.publish(msg);
    }


    // Controls

    Vector6d JointSpaceController_1::joint_control(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time) {
      Vector6d Qg;
      Qg << q_goal_;

      Qinit_ << qHome_.q;

      std::vector<Vector6d> out = interpolate_joint2(Qinit_, Qg, start_time, end_time, time.tD());
      
      // position goal
      Vector6d Qd = out[0];

      // velocity goal
      Vector6d Qdp = out[1];

      // acceliration goal
      Vector6d Qdpp = out[2];

      plot_joint_data(DeltaQ_, DeltaQp_, DeltaQi_, plot_pub_joint_errors);
      plot_joint_data(Qd, Qdp, Qdpp, plot_pub_joint_dest);
      

      // joint space

      double delta_t = 0.002;

      // erros
      DeltaQ_ = Q - Qd;
      DeltaQp_ = Qp - Qdp;
      DeltaQi_ = DeltaQi_ +  delta_t * DeltaQ_;

      // reference
      Vector6d Qrp = Qdp - qKp_*DeltaQ_ - qKi_ * DeltaQi_;
      Vector6d Qrpp = Qdpp - qKp_*DeltaQp_ - qKi_ * DeltaQ_;

      // regressor
      Yr_ = model_.regressor(Q, Qp, Qrp, Qrpp);

      // torque
      Vector6d Sq = Qp - Qrp;

      Matrix44d Gamma(Matrix44d::Zero());
      for (int i = 0; i < 44; i++) {
          Gamma(i,i) = q_gamma_;
      }
      ur::URModel::Parameters A = delta_t*Gamma*Yr_.transpose()*Sq;
      Theta_hat_ = Theta_hat_ - A;
      Vector6d tau = -qKd_ * Sq + Yr_*Theta_hat_;

      // visualize goal pose
      cc::HomogeneousTransformation T_ef_g = model_.T_ef_0(Qg);
      Vector3d X_goal = T_ef_g.translation();
      Quaterniond Q_goal(T_ef_g.rotation());
      vis_pose(Q_goal, X_goal, "dh_arm_joint_0", vis_pub_d);

      return tau;
    }

    Vector6d JointSpaceController_1::operational_control(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp, Vector6d Xdpp) {
      
      // time step
      double delta_t = 0.002;

      // Jaobians
      Matrix6d J_ef_0 = model_.J_ef_0(Q);
      Matrix6d Jinv = J_ef_0.inverse();
      Matrix6d Jp = model_.Jp_ef_0(Q, Qp);

      // current position
      cc::HomogeneousTransformation T_ef_0 = model_.T_ef_0(Q);
      Quaterniond Q_ef_0(T_ef_0.orientation());
      Vector7d X_ef_0;
      X_ef_0 << T_ef_0.position(), Q_ef_0.coeffs();

      // current velocity
      Vector6d Xp_ef_0 = J_ef_0*Qp;

      // goal pose
      Quaterniond Qd;
      Qd.coeffs() = Xd.tail(4);
      Vector3d Xd_v = Xd.head(3);

      plot_pose_data(Xd, Xdp, Xdpp, plot_pub_pose_dest_x, plot_pub_pose_dest);
      plot_pose_data(X_ef_0, Xp_ef_0, Vector6d::Zero(), plot_pub_pose_x, plot_pub_pose);

      // ======= operation space =======

      // calculate errors
      DeltaX_.head(3) = X_ef_0.head(3) - Xd.head(3);
      // DeltaX.tail(3) = -cc::logErrorWorld(cc::AngularPosition(Qd), cc::AngularPosition(Q_ef_0)); // ke(Q_ef_0 * Qd.inverse());
      DeltaX_.tail(3) = -ke(Qd*Q_ef_0.inverse());

      DeltaXp_.head(3) = Xp_ef_0.head(3) - Xdp.head(3);
      DeltaXp_.tail(3).setZero();

      DeltaXi_ = DeltaXi_ +  delta_t * DeltaX_;

      plot_joint_data(DeltaX_, DeltaXp_, DeltaXi_, plot_pub_pose_errors);

      // reference
      Vector6d Xrp = Xdp - xKp_*DeltaX_ - xKi_*DeltaXi_;
      Vector6d Xrpp = Xdpp - xKp_*DeltaXp_ - xKi_*DeltaXi_;

      // regressor
      Vector6d Qrp = Jinv * Xrp;
      Vector6d Qrpp = Jinv * (Xrpp - Jp * Qrp);
      Yr_ = model_.regressor(Q, Qp, Qrp, Qrpp);
      
      // Sx
      Vector6d Sx = Xp_ef_0 - Xrp;

      // regress the model parameters
      Matrix44d Gamma(Matrix44d::Zero());
      for (int i = 0; i < 44; i++) {
          Gamma(i,i) = x_gamma_;
      }
      ur::URModel::Parameters Theta_hat_d = Gamma*Yr_.transpose()*Jinv*Sx;
      Theta_hat_ = Theta_hat_ - Theta_hat_d*delta_t;

      // calculate output torque
      Vector6d tau = -xKd_ * Jinv*Sx + Yr_*Theta_hat_;

      // ROS_WARN_STREAM("J_ef_0: \n" << J_ef_0);
      // ROS_WARN_STREAM("Jp: \n" << Jp);
      // ROS_WARN_STREAM("Jinv: \n" << Jinv);
      // ROS_WARN_STREAM("X_ef_0: \n" << X_ef_0.transpose());
      // ROS_WARN_STREAM("Xd_v: \n" << Xd_v.transpose());
      // ROS_WARN_STREAM("Xdp: \n" << Xdp.transpose());
      // ROS_WARN_STREAM("Xdpp: \n" << Xdpp.transpose());
      // ROS_WARN_STREAM("Xrp: \n" << Xrp.transpose());
      // ROS_WARN_STREAM("Xrpp: \n" << Xrpp.transpose());
      // ROS_WARN_STREAM("Qrp: \n" << Qrp.transpose());
      // ROS_WARN_STREAM("Qrpp: \n" << Qrpp.transpose());
      // ROS_WARN_STREAM("Sx: \n" << Sx.transpose());
      // ROS_WARN_STREAM("tau: \n" << tau.transpose());

      return tau;
    }

    Vector6d JointSpaceController_1::impedance_control_with_orientation(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp) {

      // current position
      cc::HomogeneousTransformation T_ef_0 = model_.T_ef_0(Q);
      Quaterniond Q_ef_0(T_ef_0.orientation());
      Vector7d X_ef_0;
      X_ef_0 << T_ef_0.position(), Q_ef_0.coeffs();

      // Jaobians
      Matrix6d J_ef_0 = model_.J_ef_0(Q);

      // current velocity
      Vector6d Xp_ef_0 = J_ef_0*Qp;

      // calculate errors
      DeltaX_.head(3) = X_ef_0.head(3) - Xd.head(3);
      DeltaX_.tail(3).setZero();
      Quaterniond Qd;
      Qd.coeffs() = Xd.tail(4);
      DeltaX_.tail(3) = -ke(Qd*Q_ef_0.inverse());

      DeltaXp_.head(3) = Xp_ef_0.head(3) - Xdp.head(3);
      DeltaXp_.tail(3).setZero();

      // position
      Vector3d DXef_0_v = DeltaX_.head(3);
      Vector3d Xef_0p_v = DeltaXp_.head(3);

      Vector3d DXef_0_w = DeltaX_.tail(3);
      Vector3d Xef_0p_w(Vector3d::Zero());

      std::vector<Eigen::Matrix<double,6,3>>  vFj_0 = calc_repel_forces(Q);

      Vector3d F_att_v = imp_Kp_v_ * (-DXef_0_v) - imp_Kd_v_ * (Xef_0p_v);
      Vector3d F_att_w = imp_Kp_w_ * (-DXef_0_w) - imp_Kd_w_ * (Xef_0p_w);
      Vector3d F_rep_v(Vector3d::Zero());
      for (int i = 0; i < vFj_0.size(); i++){
        F_rep_v += vFj_0[i].transpose().rowwise().sum();
      }
        
      Vector6d torque_att_v = J_ef_0.topRows(3).transpose() * F_att_v;
      Vector6d torque_att_w = J_ef_0.bottomRows(3).transpose() * F_att_w;
      Vector6d torque_rep_v = - J_ef_0.topRows(3).transpose() * F_rep_v;

      Vector6d tau(Vector6d::Zero());
      tau =  model_.gravityVector(Q) + torque_att_v + torque_att_w + torque_rep_v;


      // for (int i = 0; i < vFj_0.size(); i++){
      //   ROS_WARN_STREAM("#" << i);
      //   ROS_WARN_STREAM(" vFj_0: \n" << vFj_0[i]);
      // }

      // ROS_WARN_STREAM("torque_att_v: \n" << torque_att_v.transpose());
      // ROS_WARN_STREAM("torque_att_w: \n" << torque_att_w.transpose());
      // ROS_WARN_STREAM("torque_rep_v: \n" << torque_rep_v.transpose());
      // ROS_WARN_STREAM("F_att_v: \n" << F_att_v.transpose());
      // ROS_WARN_STREAM("F_att_w: \n" << F_att_w.transpose());
      // ROS_WARN_STREAM("F_rep_v: \n" << F_rep_v.transpose());
      // ROS_WARN_STREAM("J_ef_0: \n" << J_ef_0);
      // ROS_WARN_STREAM("DXef_0_v: \n" << DXef_0_v.transpose());
      // ROS_WARN_STREAM("Xef_0p_v: \n" << Xef_0p_v.transpose());
      // ROS_WARN_STREAM("X_ef_0: \n" << X_ef_0.transpose());
      // ROS_WARN_STREAM("Xp_ef_0: \n" << Xp_ef_0.transpose());
      // ROS_WARN_STREAM("tau: \n" << tau.transpose());

      return tau;
    }
    
    Vector6d JointSpaceController_1::impedance_control(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp) {

      // current position
      cc::HomogeneousTransformation T_ef_0 = model_.T_ef_0(Q);
      Quaterniond Q_ef_0(T_ef_0.orientation());
      Vector7d X_ef_0;
      X_ef_0 << T_ef_0.position(), Q_ef_0.coeffs();

      // Jaobians
      Matrix6d J_ef_0 = model_.J_ef_0(Q);

      // current velocity
      Vector6d Xp_ef_0 = J_ef_0*Qp;

      // calculate errors
      DeltaX_.head(3) = X_ef_0.head(3) - Xd.head(3);
      DeltaX_.tail(3).setZero();

      DeltaXp_.head(3) = Xp_ef_0.head(3) - Xdp.head(3);
      DeltaXp_.tail(3).setZero();

      Vector3d DXef_0;
      DXef_0 << DeltaX_.head(3);

      Vector3d Xef_0p = DeltaXp_.head(3);

      std::vector<Eigen::Matrix<double,6,3>>  vFj_0 = calc_repel_forces(Q);

      Vector3d F_att = imp_Kp_v_ * (-DXef_0) - imp_Kd_v_ * (Xef_0p);
      Vector3d F_rep(Vector3d::Zero());
      for (int i = 0; i < vFj_0.size(); i++){
        F_rep += vFj_0[i].transpose().rowwise().sum();
      }
        
      Vector6d torque_att = J_ef_0.topRows(3).transpose() * F_att;
      Vector6d torque_rep = - J_ef_0.topRows(3).transpose() * F_rep;

      Vector6d tau(Vector6d::Zero());
      tau =  model_.gravityVector(Q) + torque_att + torque_rep;


      // for (int i = 0; i < vFj_0.size(); i++){
      //   ROS_WARN_STREAM("#" << i);
      //   ROS_WARN_STREAM(" vFj_0: \n" << vFj_0[i]);
      // }

      // ROS_WARN_STREAM("torque_att: \n" << torque_att.transpose());
      // ROS_WARN_STREAM("torque_rep: \n" << torque_rep.transpose());
      // ROS_WARN_STREAM("F_att: \n" << F_att.transpose());
      // ROS_WARN_STREAM("F_rep: \n" << F_rep.transpose());
      // ROS_WARN_STREAM("J_ef_0: \n" << J_ef_0);
      // ROS_WARN_STREAM("DXef_0: \n" << DXef_0.transpose());
      // ROS_WARN_STREAM("Xef_0p: \n" << Xef_0p.transpose());
      // ROS_WARN_STREAM("X_ef_0: \n" << X_ef_0.transpose());
      // ROS_WARN_STREAM("Xp_ef_0: \n" << Xp_ef_0.transpose());
      // ROS_WARN_STREAM("tau: \n" << tau.transpose());

      return tau;
    }

    // not finished before the assignment time
    Vector6d JointSpaceController_1::impedance_control_joint3(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp) {

      // current position
      cc::HomogeneousTransformation T_3_0 = model_.T_j_0(Q, 2);
      Quaterniond Q_3_0(T_3_0.orientation());
      Vector7d X_3_0;
      X_3_0 << T_3_0.position(), Q_3_0.coeffs();

      // Jaobians
      Matrix6d J_3_0 = model_.J_j_0(Q, 2);

      // current velocity
      Vector6d Xp_3_0 = J_3_0*Qp;

      // calculate goals for joint 3
      cc::MatrixX Qs;
      cc::HomogeneousTransformation T;
      T.position() = Xd.head(3);
      Quaterniond Qd;
      Qd.coeffs() = Xd.tail(4);
      T.orientation() = Qd.toRotationMatrix();
      model_.inverseKinematics(Qs, T, 0);

      ROS_WARN_STREAM("Qs: \n" << Qs);

      // calculate errors
      DeltaX_.head(3) = X_3_0.head(3) - Xd.head(3);
      DeltaX_.tail(3).setZero();

      DeltaXp_.head(3) = Xp_3_0.head(3) - Xdp.head(3);
      DeltaXp_.tail(3).setZero();

      Vector3d DX3_0;
      DX3_0 << DeltaX_.head(3);

      Vector3d X3_0p = DeltaXp_.head(3);

      std::vector<Eigen::Matrix<double,6,3>>  vFj_0 = calc_repel_forces(Q);

      Vector3d F_att = imp_Kp_v_ * (-DX3_0) - imp_Kd_v_ * (X3_0p);
      Vector3d F_rep(Vector3d::Zero());
      for (int i = 0; i < vFj_0.size(); i++){
        F_rep += vFj_0[i].transpose().rowwise().sum();
      }
        
      Vector6d torque_att = J_3_0.topRows(3).transpose() * F_att;
      Vector6d torque_rep = - J_3_0.topRows(3).transpose() * F_rep;

      Vector6d tau(Vector6d::Zero());
      tau =  model_.gravityVector(Q) + torque_att + torque_rep;


      // for (int i = 0; i < vFj_0.size(); i++){
      //   ROS_WARN_STREAM("#" << i);
      //   ROS_WARN_STREAM(" vFj_0: \n" << vFj_0[i]);
      // }

      // ROS_WARN_STREAM("torque_att: \n" << torque_att.transpose());
      // ROS_WARN_STREAM("torque_rep: \n" << torque_rep.transpose());
      // ROS_WARN_STREAM("F_att: \n" << F_att.transpose());
      // ROS_WARN_STREAM("F_rep: \n" << F_rep.transpose());
      // ROS_WARN_STREAM("J_ef_0: \n" << J_ef_0);
      // ROS_WARN_STREAM("DXef_0: \n" << DXef_0.transpose());
      // ROS_WARN_STREAM("Xef_0p: \n" << Xef_0p.transpose());
      // ROS_WARN_STREAM("X_ef_0: \n" << X_ef_0.transpose());
      // ROS_WARN_STREAM("Xp_ef_0: \n" << Xp_ef_0.transpose());
      // ROS_WARN_STREAM("tau: \n" << tau.transpose());

      return tau;
    }


    // Help functions

    Vector3d JointSpaceController_1::distance_to_j_joint(Vector6d Q, int j, int id) {
      // transformation from world to base
      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      cc::HomogeneousTransformation T_j_0 = model_.T_j_0(Q,j);

      Vector4d obstacle_pos_w_h;
      obstacle_pos_w_h << obstacle_poses_[id], 1;

      Vector4d obstacle_pos_0_h = T0_w.inverse() * obstacle_pos_w_h;
      Vector3d obstacle_pos_0 = obstacle_pos_0_h.head(3);

      Vector3d dj_0 = obstacle_pos_0 - T_j_0.position();

      return dj_0;
    }

    Eigen::Matrix<double,6,3> JointSpaceController_1::calc_repel_force(Vector6d Q) {
      double epsi = 1e-3;

      // transformation from world to base
      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      Eigen::Matrix<double,6,3> Fj_0(Eigen::Matrix<double,6,3>::Zero());

      for (int j = 0; j < 6; j++) {

        Vector3d dj_0 = distance_to_j_joint(Q, j, 0);
        double ndj_0 = dj_0.norm();

        if (ndj_0 < rad_influence_) {
          double mag = pow(fac_/(ndj_0+epsi), 3);
        
          Vector3d v;
          v << mag*dj_0(0)/ndj_0 ,mag*dj_0(1)/ndj_0, mag*dj_0(2)/ndj_0;
          Fj_0.block(j, 0, 1, 3) = v.transpose();
        }
      }

      return Fj_0;
    }

    std::vector<Eigen::Matrix<double,6,3>> JointSpaceController_1::calc_repel_forces(Vector6d Q) {
      double epsi = 1e-3;

      // transformation from world to base
      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      std::vector<Eigen::Matrix<double,6,3>> vFj_0;

      for (int i = 0; i < obstacle_poses_.size(); i++) {
        Eigen::Matrix<double,6,3> Fj_0(Eigen::Matrix<double,6,3>::Zero());

        // ball 2 modifications parameters
        int size = obstacle_poses_.size();
        double offset = 0;
        double multiplier = 1;
        double direction = 1;
        if ((size == 3 && i == 2) || (size == 4 && i == 3)) {
          offset = 1.5;
          multiplier = 10;
          direction = 1;
        }

        for (int j = 0; j < 6; j++) {
          Vector3d dj_0 = distance_to_j_joint(Q, j, i);

          Vector3d v_offset(Vector3d::Zero());                    // ball 2 modifications
          v_offset << offset, 0, 0;                              // ball 2 modifications
          dj_0 += v_offset;                                       // ball 2 modifications
          double ndj_0 = dj_0.norm();                                 

          if (ndj_0 < rad_influence_ + offset) {                  // ball 2 modifications
            double mag = pow(fac_/(ndj_0+epsi), 1) * multiplier;  // ball 2 modifications
          
            Vector3d v;
            v << mag*dj_0(0)/ndj_0 ,mag*dj_0(1)/ndj_0, direction * mag*dj_0(2)/ndj_0; // ball 2 modifications
            Fj_0.row(j) = v.transpose();

            // ROS_WARN_STREAM("expr2: \n" << pow(fac_/(ndj_0+epsi), 2));
            // ROS_WARN_STREAM("expr1: \n" << pow(fac_/(ndj_0+epsi), 1));
            // ROS_WARN_STREAM("fac_: \n" << fac_);
            // ROS_WARN_STREAM("ndj_0: \n" << ndj_0);
            // ROS_WARN_STREAM("mag: \n" << mag);
            // ROS_WARN_STREAM("v: \n" << v.transpose());
          }
        }

        vFj_0.push_back(Fj_0);
      }

      return vFj_0;
    }

    Quaterniond JointSpaceController_1::quat_for_marker_tracking(Vector6d Q) {

      // transformation from world to base
      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      // transformation from world to end-effector
      Matrix4d T_ef_w_start = T0_w * T_ef_0_start_.matrix();

      // starting orientation
      cc::HomogeneousTransformation T_ef_0 = model_.T_ef_0(Q);
      Matrix3d R_ef_0_start = T_ef_0_start_.orientation();

      // Marker position with respect to end-effector
      Vector4d target_pos_w_hom;
      target_pos_w_hom << target_pos_, 1;
      Vector4d target_pos_ef_hom = T_ef_w_start.inverse() * target_pos_w_hom;  
      Vector3d target_pos_ef = target_pos_ef_hom.head(3);

      // tracking marker visualization
      Quaterniond km(Quaterniond::Identity());
      Vector3d vm = target_pos_w_hom.head(3);
      vis_pose(km, vm, "world", vis_pub_m);

      // Angle offsets for XYZ euler rotation
      double alpha = atan2(target_pos_ef(1), target_pos_ef(2));
      double beta = atan2(target_pos_ef(0), sqrt(pow(target_pos_ef(1),2) + pow(target_pos_ef(2),2)));

      Vector3d eul;
      eul << -alpha, beta, 0;

      double sx = sin(eul(0));
      double sy = sin(eul(1));
      double sz = sin(eul(2));
      double cx = cos(eul(0));
      double cy = cos(eul(1));
      double cz = cos(eul(2));

      Matrix3d Rx;
      Rx << 1, 0, 0,
        0, cx, -sx,
        0, sx, cx;

      Matrix3d Ry;
      Ry << cy, 0, sy,
        0, 1, 0,
        -sy, 0, cy;

      Matrix3d Rz;
      Rz << cz, -sz, 0,
        sz, cz, 0,
        0, 0, 1;

      Matrix3d R_goal =  R_ef_0_start * Rx * Ry * Rz;
      Quaterniond Q_goal(R_goal);   

      return Q_goal;
    }

    Quaterniond JointSpaceController_1::quat_for_marker_tracking_with_current_orientation(Vector6d Q) {

      // transformation from world to base
      Matrix4d T0_w;
      T0_w << -1, 0, 0, 0,
              0, -1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1;

      // transformation from base to end-effector
      cc::HomogeneousTransformation T_ef_0 = model_.T_ef_0(Q);

      // current transformation from world to end-effector
      Matrix4d T_ef_w = T0_w * T_ef_0.matrix();

      // current orientation
      Matrix3d R_ef_0 = T_ef_0.orientation();

      // Marker position with respect to end-effector
      Vector4d target_pos_w_hom;
      target_pos_w_hom << target_pos_, 1;
      Vector4d target_pos_ef_hom = T_ef_w.inverse() * target_pos_w_hom;  
      Vector3d target_pos_ef = target_pos_ef_hom.head(3);

      // tracking marker visualization
      Quaterniond km(Quaterniond::Identity());
      Vector3d vm = target_pos_w_hom.head(3);
      vis_pose(km, vm, "world", vis_pub_m);

      // Angle offsets for XYZ euler rotation
      double alpha = atan2(target_pos_ef(1), target_pos_ef(2));
      double beta = atan2(target_pos_ef(0), sqrt(pow(target_pos_ef(1),2) + pow(target_pos_ef(2),2)));

      Vector3d eul;
      eul << -alpha, beta, 0;

      double sx = sin(eul(0));
      double sy = sin(eul(1));
      double sz = sin(eul(2));
      double cx = cos(eul(0));
      double cy = cos(eul(1));
      double cz = cos(eul(2));

      Matrix3d Rx;
      Rx << 1, 0, 0,
        0, cx, -sx,
        0, sx, cx;

      Matrix3d Ry;
      Ry << cy, 0, sy,
        0, 1, 0,
        -sy, 0, cy;

      Matrix3d Rz;
      Rz << cz, -sz, 0,
        sz, cz, 0,
        0, 0, 1;

      Matrix3d R_goal =  R_ef_0 * Rx * Ry * Rz;
      Quaterniond Q_goal(R_goal);   

      return Q_goal;
    }

    Vector6d JointSpaceController_1::interpolate_joint(Vector6d pc, Vector6d pg, double total_time, double ct) {
          if (ct > total_time) {
              return pg;
          }
            
          Vector6d v = pc + (pg - pc)*ct/total_time;

          return v;
    }

    std::vector<Vector6d> JointSpaceController_1::interpolate_joint2(Vector6d c, Vector6d g, double ti, double tg, double t) {

      std::vector<Vector6d> v;

      Vector6d z(Vector6d::Zero());

      if (t < ti) {
        v.push_back(c);
        v.push_back(z);
        v.push_back(z);
        return v;
      }

      if (t > tg) {
        v.push_back(g);
        v.push_back(z);
        v.push_back(z);
        return v;
      }
        
      Matrix6d x;
      x.col(0) = c;
      x.col(1) = g;
      x.col(2) = z;
      x.col(3) = z;
      x.col(4) = z;
      x.col(5) = z;
        
      Matrix6d T;
      T << 1, ti, pow(ti,2), pow(ti,3), pow(ti,4), pow(ti,5),
          1, tg, pow(tg,2), pow(tg,3), pow(tg,4), pow(tg,5),
          0, 1, 2*ti, 3*pow(ti,2), 4*pow(ti,3), 5*pow(ti,4),
          0, 1, 2*tg, 3*pow(tg,2), 4*pow(tg,3), 5*pow(tg,4),
          0, 0, 2, 6*ti, 12*pow(ti,2), 20*pow(ti,3),
          0, 0, 2, 6*tg, 12*pow(tg,2), 20*pow(tg,3);

      Matrix6d a = T.inverse() * x.transpose();
      Vector6d pt;
      pt << 1, t, pow(t,2), pow(t,3), pow(t,4), pow(t,5);
      Vector6d vt;
      vt << 0, 1, 2*t, 3*pow(t,2), 4*pow(t,3), 5*pow(t,4);
      Vector6d at;
      at << 0, 0, 2, 6*t, 12*pow(t,2), 20*pow(t,3);
      
      Vector6d apt = pt.transpose()*a;
      Vector6d avt = vt.transpose()*a;
      Vector6d aat = at.transpose()*a;

      v.push_back(apt);
      v.push_back(avt);
      v.push_back(aat);

      return v;
    }

    std::vector<Vector3d> JointSpaceController_1::interpolate_joint2(Vector3d c, Vector3d g, double ti, double tg, double t) {

      std::vector<Vector3d> v;

      Vector3d z(Vector3d::Zero());

      if (t < ti) {
        v.push_back(c);
        v.push_back(z);
        v.push_back(z);
        return v;
      }

      if (t > tg) {
        v.push_back(g);
        v.push_back(z);
        v.push_back(z);
        return v;
      }
        
      Eigen::Matrix<double,3,6> x;
      x.col(0) = c;
      x.col(1) = g;
      x.col(2) = z;
      x.col(3) = z;
      x.col(4) = z;
      x.col(5) = z;
        
      Matrix6d T;
      T << 1, ti, pow(ti,2), pow(ti,3), pow(ti,4), pow(ti,5),
          1, tg, pow(tg,2), pow(tg,3), pow(tg,4), pow(tg,5),
          0, 1, 2*ti, 3*pow(ti,2), 4*pow(ti,3), 5*pow(ti,4),
          0, 1, 2*tg, 3*pow(tg,2), 4*pow(tg,3), 5*pow(tg,4),
          0, 0, 2, 6*ti, 12*pow(ti,2), 20*pow(ti,3),
          0, 0, 2, 6*tg, 12*pow(tg,2), 20*pow(tg,3);

      Eigen::Matrix<double,6,3> a = T.inverse() * x.transpose();
      Vector6d pt;
      pt << 1, t, pow(t,2), pow(t,3), pow(t,4), pow(t,5);
      Vector6d vt;
      vt << 0, 1, 2*t, 3*pow(t,2), 4*pow(t,3), 5*pow(t,4);
      Vector6d at;
      at << 0, 0, 2, 6*t, 12*pow(t,2), 20*pow(t,3);
      
      Vector3d apt = pt.transpose()*a;
      Vector3d avt = vt.transpose()*a;
      Vector3d aat = at.transpose()*a;

      v.push_back(apt);
      v.push_back(avt);
      v.push_back(aat);

      return v;
    }

    Vector3d ke(Quaterniond Q) {
      double one = double(1) - 1e-8;
      double theta = double(2)*std::atan2(Q.vec().norm(), Q.w());

      // avoid division by 0
      if (Q.w() < 0) {
        Q.coeffs() = -1 * Q.coeffs();
      }

      double d = Q.w()*Q.w();

      // linear interpolation
      if(std::abs(d) >= one) {
        return double(2)*(double(1) + double(1)/double(6)*theta*theta)*Q.vec();
      }

      return theta/std::sin(theta/double(2))*Q.vec();
    }
    
    bool is_all_less(Vector6d a, double range) {
      bool is_less = false;
      for (int i = 0; i < 6; i++) {
        is_less = is_less || (a(i) < range);
      }

      // ROS_WARN_STREAM("is_less : \n" << is_less);

      return is_less;
    }

    Vector3d circular_offset(double t) {
      Vector3d offset;
      offset << -0.1*cos(0.8 * t) +0.1, 0.1*sin(0.8 * t), 0;

      return offset;
    }

    Vector3d circular_offset_speed(double t) {
      Vector3d offset;
      offset << 0.8*0.1*sin(0.8 * t), 0.8*0.1*cos(0.8 * t), 0;

      return offset;
    }


  } // namespace RobotControllers
} // namespace tum_ics_ur_robot_lli
