#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

#source $scriptpath/manifest.sh
IGC_VERSION=1.0.5964

cd $GFX_BUILD_HOME || exit 1
git clone http://github.com/intel/intel-graphics-compiler.git igc
cd igc || exit 1
git checkout tags/igc-$IGC_VERSION


# Download dependencies
cd $GFX_BUILD_HOME || exit 1
git clone https://github.com/intel/vc-intrinsics vc-intrinsics
git clone -b release/10.x https://github.com/llvm/llvm-project llvm-project
git clone -b ocl-open-100 https://github.com/intel/opencl-clang llvm-project/llvm/projects/opencl-clang
git clone -b llvm_release_100 https://github.com/KhronosGroup/SPIRV-LLVM-Translator llvm-project/llvm/projects/llvm-spirv
git clone https://github.com/intel/llvm-patches llvm_patches
