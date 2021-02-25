#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

cd $GFX_BUILD_HOME || exit 1
mkdir -p install/igc
mkdir -p build/igc
rm -rf install/igc/*

# fix patching
cd llvm-project || exit 1
git checkout -b tag llvmorg-10.0.0

cd $GFX_BUILD_HOME/build/igc || exit 1
cmake -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/igc \
    $GFX_BUILD_HOME/igc/ || exit 1
#make DESTDIR=$GFX_BUILD_HOME/install/igc install -j`nproc`
make install -j`nproc`
rm -rf $GFX_BUILD_HOME/build
echo "Done"
