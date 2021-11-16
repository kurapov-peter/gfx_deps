#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

source $scriptpath/manifest.sh

# cd $GFX_BUILD_HOME || exit 1
# mkdir -p install/llvm
# mkdir -p build/llvm
# rm -rf install/llvm/*

# cd $GFX_BUILD_HOME/build/llvm || exit 1
# cmake -G Ninja $GFX_BUILD_HOME/llvm-project/llvm \
#     -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;libc;libcxx;libcxxabi;libunwind;lld;lldb;openmp" \
#     -DLIBCXXABI_USE_COMPILER_RT=YES \
#     -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/llvm || exit 1
# cmake --build .
# cmake --build . --target install

# # https://github.com/KhronosGroup/SPIRV-LLVM-Translator/tree/llvm_release_110#build-with-pre-built-llvm
# cd $GFX_BUILD_HOME || exit 1
# mkdir -p install/llvm-spirv
# mkdir -p build/llvm-spirv
# rm -rf install/llvm-spirv/*
# 
# cd $GFX_BUILD_HOME/build/llvm-spirv || exit 1
# cmake -DCMAKE_BUILD_TYPE=Debug $GFX_BUILD_HOME/llvm-spirv \
#     -DLLVM_DIR=$GFX_BUILD_HOME/install/llvm/lib/cmake/llvm/ \
#     -DLLVM_SPIRV_BUILD_EXTERNAL=YES \
#     -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/llvm-spirv || exit 1
# make install -j`nproc`
# 
# # https://github.com/intel/opencl-clang/tree/ocl-open-110#out-of-tree-build
# cd $GFX_BUILD_HOME || exit 1
# mkdir -p install/opencl-clang
# mkdir -p build/opencl-clang
# rm -rf install/opencl-clang/*
# 
# cd $GFX_BUILD_HOME/build/opencl-clang || exit 1
# cmake $GFX_BUILD_HOME/opencl-clang \
#     -DPREFERRED_LLVM_VERSION="$IGC_LLVM_VERSION" \
#     -DLLVMSPIRV_INCLUDED_IN_LLVM=OFF \
#     -DLLVM_DIR=$GFX_BUILD_HOME/install/llvm/lib/cmake/llvm/ \
#     -DSPIRV_TRANSLATOR_DIR=$GFX_BUILD_HOME/install/llvm-spirv \
#     -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/opencl-clang || exit 1
# make all -j`nproc`
# make install


# https://github.com/intel/intel-graphics-compiler/blob/igc-1.0.8744/documentation/build_ubuntu.md#use-preinstalled-packages
cd $GFX_BUILD_HOME || exit 1
mkdir -p install/igc
mkdir -p build/igc
rm -rf install/igc/*

cd $GFX_BUILD_HOME/build/igc || exit 1
cmake -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/igc \
    -DIGC_OPTION__LLVM_PREFERRED_VERSION=$IGC_LLVM_VERSION \
    $GFX_BUILD_HOME/igc/ || exit 1
make install -j`nproc`


# cd $GFX_BUILD_HOME/build/igc || exit 1
# cmake -DCMAKE_BUILD_TYPE=Debug \
#     -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/igc \
#     -DLLVM_DIR=$GFX_BUILD_HOME/install/llvm/lib/cmake/llvm/ \
#     -DIGC_OPTION__LLVM_PREFERRED_VERSION=$IGC_LLVM_VERSION \
#     $GFX_BUILD_HOME/igc/ || exit 1
# make install -j`nproc`

echo "Done"
