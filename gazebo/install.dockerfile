FROM gazebo  AS builder 

FROM ubuntu:noble 

COPY --from=builder /gz-build/install /gz-build/install   

RUN apt update && \
    apt install -y ruby\
     #libqt5core5a \
     #libqt5quick5 \
     libtinyxml-dev \
     libpython3.12 \
     libjsoncpp25 \
     libzip-dev \
     liburdfdom-dev \
     libspdlog-dev  \
     libzmq5 \
     libassimp5 \
     libfreeimage3 \ 
    gdal-bin  \ 
    #libdart-all-dev \ 
    libprotobuf32t64 \ 
    libbullet-dev \ 
    libdart-dev \
    libdart-collision-ode-dev \ 
    libdart-collision-bullet-dev \ 
    curl 


ENV GZ_CONFIG_PATH=/gz-build/install/share/gz 
ENV LD_LIBRARY_PATH=/gz-build/install/lib 

COPY box.sdf ./