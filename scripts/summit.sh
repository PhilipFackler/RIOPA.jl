#!/bin/bash

module load git
module load hdf5
module load julia

export JULIA_HDF5_PATH="$OLCF_HDF5_ROOT/bin"

readonly self_path=$(cd $(dirname "${BASH_SOURCE[0]}"); pwd)
cp ${self_path}/SummitPreferences.toml $PWD/LocalPreferences.toml

julia --project -e 'using Pkg; Pkg.build(verbose=true)'

