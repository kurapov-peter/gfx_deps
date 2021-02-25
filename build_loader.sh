#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

cd $GFX_BUILD_HOME || exit 1
mkdir -p install/neo_loader
mkdir -p build/neo_loader
rm -rf install/neo_loader/*

cd build/neo_loader || exit 1
cmake $GFX_BUILD_HOME/neo_loader/ -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/neo_loader
cmake --build . --config Debug --target install
rm -rf $GFX_BUILD_HOME/build
#make DESTDIR=$GFX_BUILD_HOME/install/neo_loader install -j`nproc`
