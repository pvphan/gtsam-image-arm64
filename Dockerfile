FROM nvcr.io/nvidia/l4t-base:r32.6.1

WORKDIR /tmp
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        g++ \
        make \
        cmake \
        libboost-all-dev \
        libeigen3-dev \
        git \
        apt-transport-https ca-certificates \
        && update-ca-certificates

RUN git clone https://github.com/borglab/gtsam.git && cd gtsam && git checkout 4.1rc && \
        cd /tmp/gtsam && \
        mkdir build && \
        cd build && \
        cmake -D GTSAM_USE_QUATERNIONS=ON \
                -D GTSAM_USE_SYSTEM_EIGEN=ON \
                -D CMAKE_INSTALL_PREFIX=/usr/local \
                -D CMAKE_BUILD_TYPE=Release \
                -D GTSAM_WITH_TBB=OFF \
                .. && \
        make install && \
        rm -rf /tmp/gtsam
