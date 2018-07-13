#!/bin/bash
#SBATCH -c 16
#SBATCH --mem=60G
#SBATCH -t 7-00:00:00
source activate primer-id-5vm
scons -j2
