#!/bin/bash

ILCSOFT=/cvmfs/clicdp.cern.ch/iLCSoft/builds/current/CI_gcc
source $ILCSOFT/init_ilcsoft.sh

source /cvmfs/clicdp.cern.ch/compilers/gcc/6.2.0/x86_64-centos7/setup.sh
source /cvmfs/clicdp.cern.ch/software/CMake/3.6.2/x86_64-centos7-gcc62-opt/setup.sh

cd /Package
mkdir build
cd build
cmake -C $ILCSOFT/ILCSoft.cmake -DCMAKE_CXX_FLAGS="-fPIC" .. && \
export PATH=$PATH:/Package/cov-analysis-linux64/bin && \
cov-configure --gcc --compiler /cvmfs/clicdp.cern.ch/compilers/gcc/6.2.0/x86_64-centos7/bin/gcc && \
cov-build --dir cov-int make VERBOSE=1 -j2 && \
tar czvf myproject.tgz cov-int
