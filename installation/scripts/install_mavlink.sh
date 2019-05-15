#!/bin/bash
# author: Tomas Baca

# remove the default installation of mavlink, etc.
sudo apt-get -y remove ros-melodic-mavros* ros-melodic-mavlink* ros-melodic-libmavconn
sudo apt-get -y install python3-pip

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

sudo apt-get -y install python3-pip
pip install --user future

# install mavlink headers
cd "$MY_PATH/../../lib/mavlink/"
mkdir build
cd build
cmake ../
make
sudo make install
cd ..
rm -rf build

# copy the ros makefile and config
sudo rm -rf /usr/share/mavlink
sudo mkdir /usr/share/mavlink
sudo cp -r ros/* /usr/share/mavlink/
