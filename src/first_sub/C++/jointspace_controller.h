#ifndef UR_ROBOT_LLI_JOINTSPACE_CONTROLLER_H
#define UR_ROBOT_LLI_JOINTSPACE_CONTROLLER_H

#include <tum_ics_ur_robot_lli/RobotControllers/ControlEffort.h>

namespace tum_ics_ur_robot_lli
{
  namespace RobotControllers
  {

    class JointSpaceController : public ControlEffort
    {
    //private
    protected:
      bool startFlag_;

      Vector6d qStart_;
      JointState qInit_;
      JointState qHome_;
      JointState qPark_;

      ros::NodeHandle nh_;
      ros::Publisher control_data_pub_;

      Matrix6d Kp_;
      Matrix6d Kd_;
      Matrix6d Ki_;
      Vector6d goal_;
      double totalTime_;

      Vector6d DeltaQ_;
      Vector6d DeltaQp_;

    public:
      JointSpaceController(double weight = 1.0, const QString &name = "SimpleEffortCtrl");

      ~JointSpaceController();

      void setQInit(const JointState &qinit);

      void setQHome(const JointState &qhome);

      void setQPark(const JointState &qpark);

    //private
    protected:
      bool init();

      bool start();

      /**
       * @brief update the controller
       * 
       * @param time holds the current robot time
       * @param current current jointstate q, qP of the real robot
       * @return Vector6d next torque command
       */
      Vector6d update(const RobotTime &time, const JointState &current);

      bool stop();
    };


    class JointSpaceController_1 : public ControlEffort
    {
    protected:
      bool startFlag_;

      Vector6d qStart_;
      JointState qInit_;
      JointState qHome_;
      JointState qPark_;

      ros::NodeHandle nh_;
      ros::Publisher control_data_pub_;

      Matrix6d Kp_;
      Matrix6d Kd_;
      Matrix6d Ki_;
      Vector6d goal_;
      double totalTime_;

      Vector6d DeltaQ_;
      Vector6d DeltaQp_;

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

      Matrix6d calc_M(Vector6d Q, Vector6d Qp, Vector12d L, Matrix6d I, Vector6d masses);

      Matrix6d calc_C(Vector6d Q, Vector6d Qp, Vector12d L, Matrix6d I, Vector6d masses);

      Vector6d calc_G(Vector6d Q, Vector6d Qp, Vector12d L, Matrix6d I, Vector6d masses, Vector3d g);

      VectorRegressor_1 calc_Theta(Vector12d L, Matrix6d I, Vector6d masses, Vector3d g);

      MatrixRegressor_1 calc_Yr(Vector6d Q, Vector6d Qp,  Vector6d Qpp);

      Matrix4d FK(Vector6d Q, Vector12d L);

      Matrix6d Jac(Vector6d Q, Vector12d L);
    };


  } // namespace RobotControllers
} // namespace tum_ics_ur_robot_lli


#endif // UR_ROBOT_LLI_JOINTSPACE_CONTROLLER_H
