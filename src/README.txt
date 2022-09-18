Running the project:

Running the simulation
1. roslaunch tum_ics_ur10_bringup bringUR10-simulator.launch

Uploading parameters for the controler
2. roslaunch ur_model test_ur10_model.launch

Running the controler
3. roslaunch tum_ics_ur10_controller_tutorial test_jointspace_controller_1.launch

Enjoy :)

Created files in tum_ics_ur10_controller_tutorial:
- jointspace_controller_1.h
- jointspace_controller_1.cpp
- my_models.cpp 
- test_jointspace_controller_1.launch
- jointspace_controller_1.yaml

In order to display a sub task, one needs to change in the update method the function 
"operational_control_multi_obstacle_avoidance_and_circular_motion_and_tracking" to any of these:
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
