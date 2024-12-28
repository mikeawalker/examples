FROM ubuntu:noble
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y python3-pip  python3-venv lsb-release gnupg curl git cmake  libeigen3-dev build-essential 


WORKDIR /gz-build 
RUN python3 -m venv /gz-build/venv

# Set environment variables to use the virtual environment
ENV PATH="/gz-build/venv/bin:$PATH"
ENV PIP_NO_CACHE_DIR=off 

RUN pip3 install vcstool colcon-common-extensions pybind11

RUN mkdir -p src && \
    cd src && \ 
    curl -O https://raw.githubusercontent.com/gazebo-tooling/gazebodistro/master/collection-ionic.yaml  &&\ 
    vcs import < collection-ionic.yaml


RUN  curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" |  tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \ 
    cd src &&\ 
    apt update && \ 
    apt -y install $(sort -u $(find . -iname 'packages-'`lsb_release -cs`'.apt' -o -iname 'packages.apt' | grep -v '/\.git/') | sed '/gz\|sdf/d' | tr '\n' ' ')



# TODO: Fix this line so gzsim no longer depends on qt??
#RUN cd src/gz-sim/src/ && sed -i 's/^add_subdirectory(gui)$/#add_subdirectory(gui)/' CMakeLists.txt && sed -i '/add_executable(runGui cmd\/runGui_main.cc)/s/^/# /; /target_link_libraries(runGui PRIVATE ${gz_lib_target})/s/^/# /' CMakeLists.txt



RUN colcon build --cmake-args ' -DBUILD_TESTING=OFF' ' -DCMAKE_BUILD_TYPE=Release' ' -DCMAKE_INSTALL_PREFIX=/gz' --merge-install


# Install build dependencies
#RUN apt-get clean \
#    && apt-get update \
#    && apt-get -y install --no-install-recommends \
#    build-essential \
#    cmake \
#    git \
#    pkg-config \
#    software-properties-common \
#    && rm -rf /var/lib/apt/lists/*
#
## Install DART dependencies
#RUN apt-get update \
#    && apt-get -y install --no-install-recommends \
#    libeigen3-dev \
#    libassimp-dev \
#    libfcl-dev \
#    libfmt-dev \
#    libnlopt-cxx-dev \
#    coinor-libipopt-dev \
#    libbullet-dev \
#    libode-dev \
#    liboctomap-dev \
#    libtinyxml2-dev \
#    liburdfdom-dev \
#    libxi-dev \
#    libxmu-dev \
#    freeglut3-dev \
#    libopenscenegraph-dev \
#    libspdlog-dev \
#    && rm -rf /var/lib/apt/lists/*

