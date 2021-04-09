from ubuntu:20.04 AS prepare_deps

ENV DEBIAN_FRONTEND=noninteractive
ENV GIT_SSL_NO_VERIFY=1

ENV GFX_BUILD_HOME=/gfx_deps

ARG ENABLE_SPIRV

COPY env_helpers.sh .
RUN bash env_helpers.sh
ENV SPV_BUILD_ENABLED=${ENABLE_SPIRV:-false}

ARG IGC_VER
ARG NEO_VER
ARG LOADER_VER

RUN apt-get update -y && apt-get install -y --no-install-recommends \
	build-essential \ 
	cmake \
	flex \
	bison \
	libz-dev \
	git \
	python \
	python3 \
	pkg-config

WORKDIR /scripts

RUN echo $http_proxy

RUN mkdir -p /gfx_deps

# get and build llvm+spirv first (conflicts with igc)
COPY get_spirv.sh .
COPY build_spirv.sh .
COPY conditional_spirv_build.sh .
RUN bash conditional_spirv_build.sh

COPY manifest.sh .

COPY get_loader.sh .
RUN bash get_loader.sh

COPY get_neo.sh .
RUN bash get_neo.sh

COPY get_igc.sh .
RUN bash get_igc.sh

COPY build_igc.sh .
RUN bash build_igc.sh

COPY build_gmm.sh .
RUN bash build_gmm.sh

COPY build_loader.sh .
RUN bash build_loader.sh

COPY build_neo.sh .
RUN bash build_neo.sh


from ubuntu:20.04
COPY --from=prepare_deps /gfx_deps/install /gfx_deps
RUN mkdir -p /scripts
COPY manifest.sh /scripts/.
COPY setup_docker_env.sh /scripts/.

