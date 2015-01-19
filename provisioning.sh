#!/bin/sh

sudo apt-get -y update
sudo apt-get -y upgrade

# Install mandatory, and then optional, ROOT dependencies
sudo apt-get -y install git dpkg-dev make g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
sudo apt-get -y install gfortran libssl-dev libpcre3-dev \
  xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
  libmysqlclient-dev libfftw3-dev cfitsio-dev \
  graphviz-dev libavahi-compat-libdnssd-dev \
  libldap2-dev python-dev libxml2-dev libkrb5-dev \
  libgsl0-dev libqt4-dev

# Get GCC 4.8 for ROOT 6
# http://ubuntuhandbook.org/index.php/2013/08/install-gcc-4-8-via-ppa-in-ubuntu-12-04-13-04/
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get -y update
sudo apt-get -y install gcc-4.8 g++-4.8
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

# Add deadsnakes PPA for Python 2.6
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo apt-get -y update
sudo apt-get -y install python2.6 python2.6-dev

# Install virtualenv to manage Python environments
sudo apt-get -y install python-virtualenv
