#!/bin/bash

module load git
module load hdf5
module load julia

export JULIA_HDF5_PATH="$OLCF_HDF5_ROOT/bin"

julia --project -e 'using Pkg; Pkg.add("MPIPreferences")'
julia --project -e 'using MPIPreferences; use_system_binary(; mpiexec="jsrun")'
julia --project -e 'using Pkg; Pkg.build(verbose=true)'

