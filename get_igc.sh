#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

if [ -z $GFX_BUILD_HOME ]; then
    echo "GFX_BUILD_HOME unset. Please use export GFX_BUILD_HOME=/your/path"
    exit 1
fi

source $scriptpath/manifest.sh


cd $GFX_BUILD_HOME || exit 1
git clone  https://github.com/llvm/llvm-project llvm-project
cd llvm-project || exit 1
git checkout tags/llvmorg-$IGC_LLVM_VERSION


cd $GFX_BUILD_HOME || exit 1
git clone http://github.com/intel/intel-graphics-compiler.git igc
cd igc || exit 1
git checkout tags/igc-$IGC_VERSION


# Download dependencies
cd $GFX_BUILD_HOME || exit 1
git clone https://github.com/intel/vc-intrinsics vc-intrinsics
cd vc-intrinsics || exit 1
git checkout $VC_INTRINSIC_SHA

#git clone -b ocl-open-$OPENCL_CLANG_VERSION https://github.com/intel/opencl-clang llvm-project/llvm/projects/opencl-clang
#git clone -b llvm_release_$SPIRV_READER_VERSION https://github.com/KhronosGroup/SPIRV-LLVM-Translator llvm-project/llvm/projects/llvm-spirv

# cd $GFX_BUILD_HOME || exit 1
# wget --continue https://github.com/llvm/llvm-project/releases/download/llvmorg-$IGC_LLVM_VERSION/clang+llvm-$IGC_LLVM_VERSION-x86_64-linux-gnu-ubuntu-20.10.tar.xz
# mkdir -p $GFX_BUILD_HOME/install/llvm || exit 1 
# tar xf clang+llvm-$IGC_LLVM_VERSION-x86_64-linux-gnu-ubuntu-20.10.tar.xz -C $GFX_BUILD_HOME/install/llvm --strip-components 1 || exit 1


cd $GFX_BUILD_HOME || exit 1
git clone -b ocl-open-$OPENCL_CLANG_VERSION https://github.com/intel/opencl-clang opencl-clang
cd opencl-clang || exit 1
git checkout $OPENCL_CLANG_SHA

cd $GFX_BUILD_HOME || exit 1
git clone -b llvm_release_$SPIRV_READER_VERSION https://github.com/KhronosGroup/SPIRV-LLVM-Translator llvm-spirv
cd llvm-spirv || exit 1
git checkout $SPIRV_READER_SHA

