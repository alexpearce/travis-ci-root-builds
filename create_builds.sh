#!/bin/bash

shopt -s extglob

# Define supported ROOT and Python versions
ROOT_VERSIONS="5.34.25
6.02.04"
PYTHON_VERSIONS="2.6
2.7
3.3
3.4"

# Download all required ROOT versions, if they've not been downloaded already,
# then extract them in to versioned folders
for RV in $ROOT_VERSIONS; do
  FILENAME=root_v${RV}.source.tar.gz
  UNTAR_DIR=ROOT-${RV}
  # Take the first character of the version string as the major version
  ROOT_MAJOR_VERSION=$(echo $RV | awk '{print substr($0,0,1)}')

  if [ -e $FILENAME ]; then
    echo "ROOT version $RV already downloaded, skipping"
  else
    echo "Downloading ROOT version $RV"
    wget ftp://root.cern.ch/root/$FILENAME
    mkdir $UNTAR_DIR
    echo "Extracting in to $UNTAR_DIR"
    tar -C $UNTAR_DIR -xzf root_v${RV}.source.tar.gz
  fi

  # For each Python version, compile ROOT within a virtualenv
  for PV in $PYTHON_VERSIONS; do
    BUILD_DIR=ROOT-${RV}_Python-${PV}
    mkdir $BUILD_DIR
    cp -R $UNTAR_DIR/root* $BUILD_DIR
    cd $BUILD_DIR/root*

    # Create a virtualenv and work within it
    # Use native venv for Python > 2
    virtualenv -p /usr/bin/python${PV} .env
    . .env/bin/activate

    # Configure and compile ROOT, then install it in to /tmp
    ./configure --all
    make
    . bin/thisroot.sh
    make DESTDIR=/tmp install

    # Deactivate the virtualenv
    deactivate

    # Create the archive for distribution and move it to /vagrant
    # This is accessible from the host machine
    cd /tmp/home/vagrant
    tar czf ${BUILD_DIR}.tar.gz $BUILD_DIR
    mv ${BUILD_DIR}.tar.gz /vagrant

    # Go back to where we started
    cd $HOME
    unset BUILD_DIR
  done

  unset UNTAR_DIR
  unset FILENAME
done

unset PYTHON_VERSIONS
unset ROOT_VERSIONS
