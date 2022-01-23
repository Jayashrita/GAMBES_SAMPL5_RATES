#!/bin/sh

module load new
module load gcc/6.3.0
module load open_mpi/3.0.0
module load cmake/3.11.4
module load fftw/3.3.4
module load python/3.6.0
#module load mkl/2018.1
source ~/gromacs-2019.4-source/bin/GMXRC.bash
source ~/plumed2-inve/sourceme.sh
#source /cluster/home/debnathj/cp2k-tools/cp2k-code-r18596-trunk-cp2k-tools-toolchain/install/setup

jname=${PWD##*/}

bsub  -J $jname -W 24:00 -n 4 gmx_mpi_d mdrun -plumed plumed.dat -s topol.tpr
#bsub  -J $jname -W 4:00 -n 1 -R "select[model==XeonGold_6150]" /cluster/home/debnathj/cp2k-6.1/exe/local/cp2k.sopt -i sn2.inp -o sn2.out
#bsub  -J $jname -W 1:30 -n 1 plumed driver --plumed plumed_coordination.dat --ixyz Hydrobromane-pos-1.xyz --length-units A 
