#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

bash $scriptpath/build_igc.sh || exit 1
bash $scriptpath/build_gmm.sh || exit 1
bash $scriptpath/build_loader.sh || exit 1
bash $scriptpath/build_neo.sh || exit 1

