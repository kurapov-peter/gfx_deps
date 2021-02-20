#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

cd $GFX_BUILD_HOME || exit 1

git clone -b release/10.x https://github.com/llvm/llvm-project llvm-project
git clone -b llvm_release_100 https://github.com/KhronosGroup/SPIRV-LLVM-Translator llvm-project/llvm/projects/llvm-spirv