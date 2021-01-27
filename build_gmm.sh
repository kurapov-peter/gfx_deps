#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

cd $GFX_BUILD_HOME || exit 1
mkdir -p install/gmm
mkdir -p build/gmm
rm -rf install/gmm/*

cd build/gmm || exit 1
cmake -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/gmm \
    $GFX_BUILD_HOME/gmm/ || exit 1
make install -j`nproc`
echo "Done"