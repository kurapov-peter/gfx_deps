# gfx_deps

The purpose of this repository is to automate intel open source gpu software stack debug build.

## Build docker image
docker build . --network host -t gfx-dev

## Run container (example)
docker run --privileged -it --name gfx_dev -v /path/to/gfx_deps:/scripts -v /path/to/mapd-deps:/usr/local/mapd-deps -v /path/to/omniscidb:/omniscidb gfx_dev:latest bash
