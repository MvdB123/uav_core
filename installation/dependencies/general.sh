#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: installing general dependencies"

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

sudo apt-get -y install cmake build-essential autotools-dev automake autoconf

# utilities
sudo apt-get -y install wget zip silversearcher-ag

# ros-related
sudo apt-get -y install \
  ros-$ROS_DISTRO-visualization-msgs\
  ros-$ROS_DISTRO-smach-*\
  ros-$ROS_DISTRO-diagnostic-updater\
  ros-$ROS_DISTRO-nav-msgs\
  ros-$ROS_DISTRO-angles\
  ros-$ROS_DISTRO-rosconsole-bridge\
  ros-$ROS_DISTRO-gazebo-*\
  ros-$ROS_DISTRO-eigen-conversions\
  ros-$ROS_DISTRO-tf-conversions\
  ros-$ROS_DISTRO-roslint\
  ros-$ROS_DISTRO-xacro\
  ros-$ROS_DISTRO-camera-info-manager\
  ros-$ROS_DISTRO-control-toolbox\
  ros-$ROS_DISTRO-image-view\
  ros-$ROS_DISTRO-image-transport\
  ros-$ROS_DISTRO-image-transport-plugins\
  ros-$ROS_DISTRO-image-geometry\
  ros-$ROS_DISTRO-compressed-image-transport\
  ros-$ROS_DISTRO-theora-image-transport\
  ros-$ROS_DISTRO-rosbash\
  ros-$ROS_DISTRO-rqt*\
  ros-$ROS_DISTRO-tf2-sensor-msgs\
  ros-$ROS_DISTRO-tf2-geometry-msgs\
  ros-$ROS_DISTRO-tf2-eigen\
  ros-$ROS_DISTRO-octomap-msgs\
  ros-$ROS_DISTRO-pcl-ros\
  ros-$ROS_DISTRO-pcl-conversions\
  ros-$ROS_DISTRO-rosdoc-lite\
  ros-$ROS_DISTRO-geographic-msgs\
  ros-$ROS_DISTRO-rviz-visual-tools\
  ros-$ROS_DISTRO-catch-ros\
  ros-$ROS_DISTRO-octomap\
  ros-$ROS_DISTRO-cmake-modules\
  ros-$ROS_DISTRO-nlopt\
  ros-$ROS_DISTRO-plotjuggler-ros\
  ros-$ROS_DISTRO-joy\

if [ "$distro" = "18.04" ]; then

sudo apt-get -y install \
  ros-melodic-multimaster-*\
  ros-melodic-flexbe-behavior-engine\
  ros-melodic-hector-gazebo-plugins\
  ros-melodic-teraranger\
  ros-melodic-sophus\

elif [ "$distro" = "20.04" ]; then

sudo apt-get -y install \
  ros-noetic-catkin \

fi

# python stuff (assuming venv already created)
source ~/projects/mrs_repos/mrs_uav_system/venv/bin/activate
source ~/projects/mrs_repos/mrs_uav_system/venv2/bin/activate
if [ "$distro" = "18.04" ]; then

python3 -m pip install \
  setuptools\
  pip\
  future


python -m pip install \
  setuptools\
  prettytable\
  argparse\
  git-core\
  empy\
  serial\
  bloom\
  catkin-tools\
  pip\
  future\
  crcmod\
  lxml

elif [ "$distro" = "20.04" ]; then

python3 -m pip install \
  setuptools\
  prettytable\
  empy\
  serial\
  bloom\
  osrf-pycommon\
  catkin-tools\
  pip\
  future\
  crcmod\
  lxml

  # python3-argparse\ # TODO find the alternative

fi

# other

sudo apt-get -y install \
  genromfs\
  ant\
  protobuf-compiler\
  libeigen3-dev\
  libopencv-dev\
  openocd\
  flex\
  bison\
  libncurses5-dev\
  libftdi-dev\
  libtool\
  zlib1g-dev\
  gcc-arm-none-eabi\
  libevent-dev\
  libncurses5-dev\
  expect-dev\
  moreutils\
  xvfb\
  libeigen3-dev\
  libsuitesparse-dev\
  protobuf-compiler\
  libnlopt-dev\
  distcc\
  ocl-icd-opencl-dev\
  ocl-icd-dev\
  ocl-icd-libopencl1\
  clinfo\
  opencl-headers\
  libgeographic-dev\
  geographiclib-tools\
  libx264-dev\
  libzstd-dev\
  libqcustomplot-dev\
  xutils-dev\
  net-tools\

if [ "$distro" = "18.04" ]; then

sudo apt-get -y install \
  libqt4-dev\

elif [ "$distro" = "20.04" ]; then

sudo apt-get -y install \
  # libqt5-dev\ # TODO find the alternative

fi
