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