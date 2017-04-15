#!/bin/bash

echo "This script will install ROS Indigo in your $(uname -r) environment";

sudo dnf install cmake gcc-c++ python-empy console-bridge-devel poco-devel boost-devel eigen3-devel urdfdom-devel gtest-devel sip-devel tinyxml-devel qt-devel python-qt5-devel PyQt4-devel curl-devel lz4-devel libjpeg-turbo-devel fltk-devel libtool-ltdl-devel opencv-devel qhull-devel assimp-devel uuid-devel libuuid-devel yaml-cpp-devel collada-dom-devel pcl-devel gtk2-devel gazebo-devel python-netifaces;

sudo dnf install python-rosdep python-rosinstall_generator python-wstool python-rosinstall;

mkdir ~/ros_catkin_ws;
cd ~/ros_catkin_ws;

rosinstall_generator desktop_full --rosdistro indigo --deps --wet-only --tar > indigo-desktop-full-wet.rosinstall;

wstool init -j8 src indigo-desktop-full-wet.rosinstall;

rosdep install --from-paths src --ignore-src --rosdistro indigo -y;

./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release -DASSIMP_UNIFIED_HEADER_NAMES=ON;
