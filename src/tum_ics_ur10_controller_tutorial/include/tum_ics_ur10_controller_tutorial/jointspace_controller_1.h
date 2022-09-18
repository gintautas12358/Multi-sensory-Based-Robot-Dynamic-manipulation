#ifndef UR_ROBOT_LLI_JOINTSPACE_CONTROLLER_H
#define UR_ROBOT_LLI_JOINTSPACE_CONTROLLER_H

#include <tum_ics_ur_robot_lli/RobotControllers/ControlEffort.h>
#include <ur_model/ur_model.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PoseArray.h>
#include <geometry_msgs/Pose.h>
#include <sensor_msgs/JointState.h>
#include <object_msgs/Objects.h>

namespace tum_ics_ur_robot_lli
{
  namespace RobotControllers
  {

    class JointSpaceController_1 : public ControlEffort
    {
    protected:
      bool startFlag_;

      Vector6d qStart_;
      JointState qInit_;
      JointState qHome_;
      JointState qPark_;

      // UR10 model from Simon
      ur::URModel model_;

      // Publishers and Subscribers
      ros::NodeHandle nh_;
      ros::Publisher control_data_pub_;
      ros::Publisher vis_pub_ef;
      ros::Publisher vis_pub_d;
      ros::Publisher vis_pub_m;
      ros::Publisher vis_pub_circle;
      ros::Publisher vis_pub_obstacle;
      ros::Publisher plot_pub_joint_errors;
      ros::Publisher plot_pub_joint_dest;
      ros::Publisher plot_pub_pose_errors;
      ros::Publisher plot_pub_pose_dest_x;
      ros::Publisher plot_pub_pose_dest;
      ros::Publisher plot_pub_pose_x;
      ros::Publisher plot_pub_pose;
      ros::Subscriber marker_sub;
      ros::Subscriber obstacle_sub;

      // Joint and operational control parameters
      Matrix6d qKp_;
      Matrix6d qKd_;
      Matrix6d qKi_;
      Matrix6d xKp_;
      Matrix6d xKd_;
      Matrix6d xKi_;
      double q_gamma_;
      double x_gamma_;
      Vector6d q_goal_;
      Vector3d x_goal_;
      double totalTime_;
      Vector6d Qinit_;

      // For start pose saving
      cc::HomogeneousTransformation T_ef_0_start_;
      Matrix3d start_orientation_;
      Vector3d start_position_;


      bool impedance_is_on;

      // Robot parameters
      Vector12d L_;
      Matrix6d I_;
      Vector6d masses_;
      Vector3d g_;

      ur::URModel::Regressor Yr_;
      ur::URModel::Parameters Theta_;
      ur::URModel::Parameters Theta_hat_;

      // Joint and catesian errors
      Vector6d DeltaQi_;
      Vector6d DeltaQ_;
      Vector6d DeltaQp_;

      Vector6d DeltaXi_;
      Vector6d DeltaX_;
      Vector6d DeltaXp_;

      // for target tracking
      Vector3d target_pos_;
      int target_id_;
      double tracking_start_time_;
      bool id_changed_;

      // for obstacle avoidance
      std::vector<Vector3d> obstacle_poses_;
      bool neg_impadace_flank;

      // Impedance control
      Matrix3d imp_Kp_v_;
      Matrix3d imp_Kd_v_;
      Matrix3d imp_Kp_w_;
      Matrix3d imp_Kd_w_;
      double rad_influence_;
      double fac_;


    public:
      JointSpaceController_1(double weight = 1.0, const QString &name = "SimpleEffortCtrl");

      ~JointSpaceController_1();

      void setQInit(const JointState &qinit);

      void setQHome(const JointState &qhome);

      void setQPark(const JointState &qpark);

    protected:

      bool init();

      bool start();

      bool stop();


      /**
       * @brief update the controller
       * 
       * @param time holds the current robot time
       * @param current current jointstate q, qP of the real robot
       * @return Vector6d next torque command
       */
      Vector6d update(const RobotTime &time, const JointState &current);

      // task 1.1, 1.2, 1.3
      Vector6d operational_control_circular_motion(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);

      // task 2.2
      Vector6d operational_control_tracking(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);
      
      // task 2.3, 2.4
      Vector6d operational_control_tracking_and_circular_motion(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);

      // task 2.5
      Vector6d operational_control_obstacle_avoidance(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);

      // task 2.6, 2.7
      Vector6d operational_control_multi_obstacle_avoidance(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);

      // task 2.7
      Vector6d operational_control_multi_obstacle_avoidance_and_circular_motion(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);
      
      // task 2.8
      Vector6d operational_control_multi_obstacle_avoidance_and_circular_motion_and_tracking(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);

      // Controls

      Vector6d joint_control(Vector6d Q, Vector6d Qp, Vector6d Qpp, double start_time, double end_time, const RobotTime &time);

      Vector6d operational_control(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp, Vector6d Xdpp);
      
      Vector6d impedance_control(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp);
      Vector6d impedance_control_with_orientation(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp);
      Vector6d impedance_control_joint3(Vector6d Q, Vector6d Qp, Vector7d Xd, Vector6d Xdp);

      // Help functions

      Vector6d interpolate_joint(Vector6d pc, Vector6d pg, double total_time, double ct);

      std::vector<Vector6d> interpolate_joint2(Vector6d c, Vector6d g, double ti, double tg, double t);
      std::vector<Vector3d> interpolate_joint2(Vector3d c, Vector3d g, double ti, double tg, double t);

      Quaterniond quat_for_marker_tracking(Vector6d Q);
      Quaterniond quat_for_marker_tracking_with_current_orientation(Vector6d Q);
      
      Vector3d distance_to_j_joint(Vector6d Q, int j, int id);
      std::vector<Vector3d> distances_to_j_joint(Vector6d Q, int j);

      Eigen::Matrix<double,6,3> calc_repel_force(Vector6d Q);
      std::vector<Eigen::Matrix<double,6,3>> calc_repel_forces(Vector6d Q);

      void plot_joint_data(Vector6d dQ, Vector6d dQp, Vector6d dQi, ros::Publisher pub);

      void plot_pose_data(Vector7d X, Vector6d Xp, Vector6d Xpp, ros::Publisher pub1, ros::Publisher pub2);

      
    public:
      void marker_sub_callback(const object_msgs::Objects& msg);

      void obstacle_sub_callback(const object_msgs::Objects& msg);
    };


  } // namespace RobotControllers
} // namespace tum_ics_ur_robot_lli


#endif // UR_ROBOT_LLI_JOINTSPACE_CONTROLLER_H
