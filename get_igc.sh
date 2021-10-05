#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

source $scriptpath/manifest.sh

cd $GFX_BUILD_HOME || exit 1
git clone http://github.com/intel/intel-graphics-compiler.git igc
cd igc || exit 1
git checkout tags/igc-$IGC_VERSION


# Download dependencies
cd $GFX_BUILD_HOME || exit 1
git clone https://github.com/intel/vc-intrinsics vc-intrinsics
git clone -b llvmorg-$IGC_LLVM_VERSION https://github.com/llvm/llvm-project llvm-project
git clone -b ocl-open-$OPENCL_CLANG_VERSION https://github.com/intel/opencl-clang llvm-project/llvm/projects/opencl-clang
git clone -b llvm_release_$SPIRV_READER_VERSION https://github.com/KhronosGroup/SPIRV-LLVM-Translator llvm-project/llvm/projects/llvm-spirv
