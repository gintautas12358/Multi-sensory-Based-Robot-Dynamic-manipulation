# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "control_core_msgs: 13 messages, 0 services")

set(MSG_I_FLAGS "-Icontrol_core_msgs:/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(control_core_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg" "geometry_msgs/Vector3:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg" "control_core_msgs/AngularState:geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg" "geometry_msgs/Wrench:geometry_msgs/Point:geometry_msgs/Vector3:geometry_msgs/Pose:geometry_msgs/Twist:geometry_msgs/Accel:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg" "geometry_msgs/Wrench:geometry_msgs/Point:geometry_msgs/Vector3:std_msgs/Header:control_core_msgs/CartesianState:geometry_msgs/Pose:geometry_msgs/Twist:geometry_msgs/Accel:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg" "geometry_msgs/Wrench:geometry_msgs/Point:geometry_msgs/Vector3:std_msgs/Header:control_core_msgs/CartesianState:geometry_msgs/Pose:geometry_msgs/Twist:geometry_msgs/Accel:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg" "control_core_msgs/Vector"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg" "control_core_msgs/Vector:control_core_msgs/JointState:std_msgs/Header"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg" "control_core_msgs/Vector:control_core_msgs/JointState:std_msgs/Header"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg" "geometry_msgs/Point:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg" "geometry_msgs/Point:control_core_msgs/LinearState:geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg" "geometry_msgs/Point:control_core_msgs/LinearState:geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg" ""
)

get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg" NAME_WE)
add_custom_target(_control_core_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "control_core_msgs" "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg" "control_core_msgs/Vector:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_cpp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(control_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(control_core_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(control_core_msgs_generate_messages control_core_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_cpp _control_core_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_core_msgs_gencpp)
add_dependencies(control_core_msgs_gencpp control_core_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_core_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)
_generate_msg_eus(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(control_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(control_core_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(control_core_msgs_generate_messages control_core_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_eus _control_core_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_core_msgs_geneus)
add_dependencies(control_core_msgs_geneus control_core_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_core_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)
_generate_msg_lisp(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(control_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(control_core_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(control_core_msgs_generate_messages control_core_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_lisp _control_core_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_core_msgs_genlisp)
add_dependencies(control_core_msgs_genlisp control_core_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_core_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)
_generate_msg_nodejs(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(control_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(control_core_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(control_core_msgs_generate_messages control_core_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_nodejs _control_core_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_core_msgs_gennodejs)
add_dependencies(control_core_msgs_gennodejs control_core_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_core_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Accel.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)
_generate_msg_py(control_core_msgs
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(control_core_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(control_core_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(control_core_msgs_generate_messages control_core_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/AngularStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/CartesianStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/JointStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearState.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/LinearStateTrajectory.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/Vector.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/gin/ros/workspaces/final/src/utilities/control_core_msgs/msg/VectorStamped.msg" NAME_WE)
add_dependencies(control_core_msgs_generate_messages_py _control_core_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(control_core_msgs_genpy)
add_dependencies(control_core_msgs_genpy control_core_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS control_core_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/control_core_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(control_core_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(control_core_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/control_core_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(control_core_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(control_core_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/control_core_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(control_core_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(control_core_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/control_core_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(control_core_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(control_core_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/control_core_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(control_core_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(control_core_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
