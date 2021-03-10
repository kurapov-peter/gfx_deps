#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

echo "spv build enabled: $SPV_BUILD_ENABLED"

if [ "$SPV_BUILD_ENABLED" != "false" ] ; then
   $scriptpath/get_spirv.sh &&
   $scriptpath/build_spirv.sh
fi