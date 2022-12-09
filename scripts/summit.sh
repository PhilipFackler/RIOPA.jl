#!/bin/bash

module load spectrum-mpi
module load git
module load hdf5
module load julia

export JULIA_HDF5_PATH="$OLCF_HDF5_ROOT/bin"

julia --project=$PWD -e 'using Pkg; Pkg.instantiate()'
julia --project=$PWD -e 'using MPIPreferences; MPIPreferences.use_system_binary(mpiexec="jsrun")'
julia --project=$PWD -e 'using Pkg; Pkg.build(verbose=true)'
