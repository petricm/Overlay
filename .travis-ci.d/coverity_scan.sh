#!/bin/bash

ILCSOFT=/cvmfs/clicdp.cern.ch/iLCSoft/builds/current/CI_gcc
source $ILCSOFT/init_ilcsoft.sh

cd /Package
mkdir build
cd build
cmake -C $ILCSOFT/ILCSoft.cmake -DCMAKE_CXX_FLAGS="-fdiagnostics-color=always" .. && \
export PATH=/Package/cov-analysis-linux64/bin:$PATH && \
cov-build --dir cov-int make -j2 && \
tar czvf myproject.tgz cov-int
