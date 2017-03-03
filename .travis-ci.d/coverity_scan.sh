#!/bin/bash

ILCSOFT=/cvmfs/clicdp.cern.ch/iLCSoft/builds/current/CI_llvm
source $ILCSOFT/init_ilcsoft.sh

source /cvmfs/clicdp.cern.ch/compilers/llvm/3.9.0/x86_64-centos7/setup.sh
source /cvmfs/clicdp.cern.ch/software/CMake/3.6.2/x86_64-centos7-llvm39-opt/setup.sh

cd /Package
mkdir build
cd build
cmake -C $ILCSOFT/ILCSoft.cmake -DCMAKE_CXX_FLAGS="-fPIC" .. && \
export PATH=/Package/cov-analysis-linux64/bin:$PATH && \
cov-build --dir cov-int make -j2 && \
tar czvf myproject.tgz cov-int
