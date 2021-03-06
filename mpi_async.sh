#!/bin/bash
#SBATCH --job-name=mpi_async
#SBATCH --time=00:01:00
#SBATCH --partition=pdlabs
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1

module load gcc openmpi netlib-lapack

mpicc tester_mpi.c knnring_mpi_async.c knnring_sequential.c -lm -I$NETLIB_LAPACK_ROOT/include -L$NETLIB_LAPACK_ROOT/lib64 -lcblas -O3 -o knnring_mpi_async

srun ./knnring_mpi_async
