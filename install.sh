#!/bin/bash
set -e

cd scratch
rm -rf PrimerID PrimerID-ba7e4e976a0d427bb812719b87a8dca01c4face1
unzip PrimerID-ba7e4e976a0d427bb812719b87a8dca01c4face1.zip
cd PrimerID-ba7e4e976a0d427bb812719b87a8dca01c4face1
unzip ../seqan-v2.0.0.zip

# enable consensus sequence output
sed -i~ -e '/DATA.write_all_statistics/ a\    DATA.write_all_consensus_to_fasta();' src/pidalyse/main.cpp

export CPATH=$CONDA_PREFIX/include
export LD_RUN_PATH=$CONDA_PREFIX/lib

$CXX -O2 -std=c++11 -o pidalign src/pidalign/pidalign.cpp -I. -I seqan-seqan-v2.0.0/include -L$CONDA_PREFIX/lib -lboost_thread -lboost_system -lpthread

$CXX -O2 -std=c++11 -o pidalyse src/pidalyse/*.cpp -I. -L$CONDA_PREFIX/lib -lgsl -lgslcblas -lboost_program_options -lboost_filesystem -lboost_system

./pidalign --help

./pidalyse --help

cd ..
ln -s PrimerID-ba7e4e976a0d427bb812719b87a8dca01c4face1 PrimerID
