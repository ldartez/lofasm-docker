FROM ubuntu:21.04
LABEL maintainer="louis.dartez@gmail.com"

ARG HOME=/root
ARG REPOS=/root/repos

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=host.docker.internal:0

# install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y vim
RUN apt install -y git python3 python3-pip python3-healpy
RUN apt install -y cmake libcfitsio-dev
RUN apt install -y libboost1.71-all-dev

# create directories
RUN mkdir $REPOS $HOME/data

# clone repos
RUN cd $REPOS && git clone https://github.com/ldartez/lofasm
RUN cd $REPOS && git clone https://github.com/ldartez/lofasmio2

# install python tools
RUN pip3 install ipython
RUN cd $REPOS/lofasm && pip install -r requirements.txt
RUN cd $REPOS/lofasm && pip install .

# install C++ tools
RUN cd $REPOS/lofasmio2 && mkdir build
RUN cd $REPOS/lofasmio2/build && cmake .. && make
