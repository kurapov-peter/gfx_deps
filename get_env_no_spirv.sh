#!/bin/sh

script=$(readlink -f "$0")
scriptpath=$(dirname "$script")

bash $scriptpath/get_loader.sh || exit 1
bash $scriptpath/get_neo.sh || exit 1
bash $scriptpath/get_igc.sh || exit 1

