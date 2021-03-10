#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

source $scriptpath/manifest.sh

cd $GFX_BUILD_HOME || exit 1
git clone https://github.com/intel/compute-runtime neo
cd neo || exit 1
git checkout tags/$NEO_VERSION
git pull

# Download deps
cd $GFX_BUILD_HOME || exit 1
git clone https://github.com/intel/gmmlib.git gmm
cd gmm || exit 1
git checkout tags/intel-gmmlib-$GMM_VERSION