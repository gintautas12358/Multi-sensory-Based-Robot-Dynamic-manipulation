# Install script for directory: /home/gin/ros/workspaces/final/src/tum_ics_ur10_controller_tutorial

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/gin/ros/workspaces/final/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/gin/ros/workspaces/final/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/gin/ros/workspaces/final/install" TYPE PROGRAM FILES "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/gin/ros/workspaces/final/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/gin/ros/workspaces/final/install" TYPE PROGRAM FILES "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/gin/ros/workspaces/final/install/setup.bash;/home/gin/ros/workspaces/final/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/gin/ros/workspaces/final/install" TYPE FILE FILES
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/setup.bash"
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/gin/ros/workspaces/final/install/setup.sh;/home/gin/ros/workspaces/final/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/gin/ros/workspaces/final/install" TYPE FILE FILES
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/setup.sh"
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/gin/ros/workspaces/final/install/setup.zsh;/home/gin/ros/workspaces/final/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/gin/ros/workspaces/final/install" TYPE FILE FILES
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/setup.zsh"
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/gin/ros/workspaces/final/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/gin/ros/workspaces/final/install" TYPE FILE FILES "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/tum_ics_ur10_controller_tutorial.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tum_ics_ur10_controller_tutorial/cmake" TYPE FILE FILES
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/tum_ics_ur10_controller_tutorialConfig.cmake"
    "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/catkin_generated/installspace/tum_ics_ur10_controller_tutorialConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tum_ics_ur10_controller_tutorial" TYPE FILE FILES "/home/gin/ros/workspaces/final/src/tum_ics_ur10_controller_tutorial/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/tum_ics_ur10_controller_tutorial" TYPE DIRECTORY FILES "/home/gin/ros/workspaces/final/src/tum_ics_ur10_controller_tutorial/include/tum_ics_ur10_controller_tutorial/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libur10_control.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libur10_control.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libur10_control.so"
         RPATH "/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib/libur10_control.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libur10_control.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libur10_control.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libur10_control.so"
         OLD_RPATH "/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools:"
         NEW_RPATH "/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libur10_control.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller"
         RPATH "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib:/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial" TYPE EXECUTABLE FILES "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller"
         OLD_RPATH "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib:/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools:"
         NEW_RPATH "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib:/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1"
         RPATH "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib:/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial" TYPE EXECUTABLE FILES "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1"
         OLD_RPATH "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib:/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools:"
         NEW_RPATH "/home/gin/ros/workspaces/final/devel/.private/tum_ics_ur10_controller_tutorial/lib:/opt/ros/noetic/lib:/home/gin/ros/workspaces/final/devel/.private/ur_model/lib:/home/gin/ros/workspaces/final/devel/.private/control_core/lib:/usr/lib/tumtools")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tum_ics_ur10_controller_tutorial/test_jointspace_controller_1")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tum_ics_ur10_controller_tutorial/launch" TYPE DIRECTORY FILES "/home/gin/ros/workspaces/final/src/tum_ics_ur10_controller_tutorial/launch/")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/gin/ros/workspaces/final/build/tum_ics_ur10_controller_tutorial/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
