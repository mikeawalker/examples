ARG BASE
FROM ${BASE} 

RUN apt update && \ 
    apt install -y git gcc g++ make gdb

RUN git clone --depth 1 --branch 3.0.0 https://github.com/dmtcp/dmtcp.git
RUN cd dmtcp && \
    ./configure --prefix=/usr --enable-unique-checkpoint-filenames && \
    make && \ 
    make install

RUN pip3 install scipy 
COPY counter.py . 

ENTRYPOINT /bin/bash