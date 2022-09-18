# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "tum_ics_ur_robot_msgs;roscpp;rospy;sensor_msgs;std_msgs;tf;tf_conversions;visualization_msgs;object_msgs;tum_ics_ur_robot_lli;geometry_msgs;sensor_msgs;control_core".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lur10_control".split(';') if "-lur10_control" != "" else []
PROJECT_NAME = "tum_ics_ur10_controller_tutorial"
PROJECT_SPACE_DIR = "/home/gin/ros/workspaces/final/install"
PROJECT_VERSION = "0.0.0"
