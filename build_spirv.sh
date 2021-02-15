#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

cd $GFX_BUILD_HOME || exit 1
mkdir -p install/spirv
mkdir -p build/spirv
rm -rf install/spirv/*

cd $GFX_BUILD_HOME/llvm-project || exit 1
git checkout release/10.x
cd $GFX_BUILD_HOME/llvm-project/llvm/projects/llvm-spirv || exit 1
git checkout llvm_release_100

cd $GFX_BUILD_HOME/build/spirv || exit 1

cmake -DLLVM_ENABLE_PROJECTS="clang" \
    $GFX_BUILD_HOME/llvm-project/llvm/ \
    -DLLVM_TARGETS_TO_BUILD=X86 \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=$GFX_BUILD_HOME/install/spirv \
    -DLLVM_ABI_BREAKING_CHECKS=FORCE_OFF \
    -DLLVM_ENABLE_ABI_BREAKING_CHECKS=0 
cmake --build . --parallel 8 --target install

