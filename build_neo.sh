#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

cd $GFX_BUILD_HOME || exit 1
mkdir -p install/neo
mkdir -p build/neo
rm -rf install/neo/*

cd build/neo || exit 1
cmake -DCMAKE_BUILD_TYPE=Debug \
    -DSKIP_UNIT_TESTS=1 \
    -DIGC_DIR=$GFX_BUILD_HOME/install/igc \
    -DGMM_DIR=$GFX_BUILD_HOME/install/gmm \
    -DBUILD_WITH_L0=1 \
    -DLEVEL_ZERO_ROOT=$GFX_BUILD_HOME/install/neo_loader \
    $GFX_BUILD_HOME/neo/ || exit 1
make DESTDIR=$GFX_BUILD_HOME/install/neo install -j`nproc` || exit 1
rm -rf $GFX_BUILD_HOME/build

