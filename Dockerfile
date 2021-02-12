from ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV GIT_SSL_NO_VERIFY=1

ENV GFX_BUILD_HOME=/gfx_deps

COPY . /scripts
WORKDIR /scripts


RUN echo $http_proxy 


RUN apt-get update -y && apt-get install -y --no-install-recommends \
	build-essential \ 
	cmake \
	flex \
	bison \
	libz-dev \
	git \
	python

RUN mkdir -p /gfx_deps

RUN bash get_igc.sh \
	&& bash get_loader.sh \ 
	&& bash get_neo.sh \ 
	&& bash get_spirv.sh 

RUN bash build_igc.sh
RUN bash build_gmm.sh
RUN bash build_loader.sh
# RUN bash build_neo.sh
# RUN bash build_spirv.sh
