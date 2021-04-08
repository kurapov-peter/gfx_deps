#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

$scriptpath/get_loader.sh || exit 1
$scriptpath/get_neo.sh || exit 1
$scriptpath/get_igc.sh || exit 1

