#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

$scriptpath/build_igc.sh || exit 1
$scriptpath/build_gmm.sh || exit 1
$scriptpath/build_loader.sh || exit 1
$scriptpath/build_neo.sh || exit 1

