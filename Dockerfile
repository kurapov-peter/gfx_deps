from ubuntu:20.04 AS prepare_deps

ENV DEBIAN_FRONTEND=noninteractive
#ENV GIT_SSL_NO_VERIFY=1

ENV GFX_BUILD_HOME=/gfx_deps

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
	pkg-config \
    wget \
    ca-certificates \
    ninja-build \
    libatomic1 \
    libatomic-ops-dev \
    --

RUN update-ca-certificates -f


WORKDIR /scripts

RUN echo $http_proxy

RUN mkdir -p /gfx_deps

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
COPY --from=prepare_deps /gfx_deps/build /gfx_deps/build
RUN mkdir -p /scripts
COPY manifest.sh /scripts/.
COPY setup_docker_env.sh /scripts/.

# setup build friendly env
ARG DEBIAN_FRONTEND=noninteractive
ENV GFX_BUILD_HOME=/gfx_deps
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    sudo

RUN apt-get install -y \
    ccache \
    git \
    curl \
    gcc-8 \
    g++-8 \
    libboost-all-dev \
    libgoogle-glog-dev \
    libssl-dev \
    libevent-dev \
    default-jre \
    default-jre-headless \
    default-jdk \
    default-jdk-headless \
    libncurses5-dev \
    libldap2-dev \
    binutils-dev \
    google-perftools \
    libdouble-conversion-dev \
    libevent-dev \
    libgflags-dev \
    libgoogle-perftools-dev \
    libiberty-dev \
    libjemalloc-dev \
    libglu1-mesa-dev \
    liblz4-dev \
    liblzma-dev \
    libbz2-dev \
    libarchive-dev \
    libcurl4-openssl-dev \
    libedit-dev \
    uuid-dev \
    libsnappy-dev \
    zlib1g-dev \
    autoconf \
    autoconf-archive \
    automake \
    libpng-dev \
    rsync \
    libfl-dev \
    unzip \
    jq \
    python-dev \
    python-yaml \
    swig \
    pkg-config \
    libxerces-c-dev \
    libxmlsec1-dev

RUN sudo update-alternatives \
  --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 \
  --slave /usr/bin/g++ g++ /usr/bin/g++-8

