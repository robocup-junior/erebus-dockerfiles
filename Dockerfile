# syntax=docker/dockerfile:1

# Generic dockerfile for Erebus 2024 controllers, with C/C++ 
# build tools, and python 3.10 pre-installed

FROM ubuntu:22.04

# Some Dockerfile code from: https://github.com/cyberbotics/webots-docker/blob/master/Dockerfile
# Determine Webots version to be used and set default argument
ARG WEBOTS_VERSION=R2023b
ARG WEBOTS_PACKAGE_PREFIX=

# Disable dpkg/gdebi interactive dialogs
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes wget bzip2 && rm -rf /var/lib/apt/lists/ && \
 wget https://github.com/cyberbotics/webots/releases/download/$WEBOTS_VERSION/webots-$WEBOTS_VERSION-x86-64$WEBOTS_PACKAGE_PREFIX.tar.bz2 && \
 tar xjf webots-*.tar.bz2 && rm webots-*.tar.bz2

# Copy webots controller lib files, since these are the only files we need for compiling controllers
# We remove some of the big files not needed for controller compilation
RUN cp -r /webots/ /usr/local/&& \
    rm -rf /usr/local/webots/lib/webots && \
    rm -rf /usr/local/webots/projects && \
    rm -rf /usr/local/webots/bin && \
    rm -rf /webots/

# Needed for libGL.so files
RUN apt-get update && apt-get install ffmpeg -y

# Install python 3.10
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt install -y python3.10 && \
    apt-get install -y python3-pip

# Install tools for C++ building, and other things (e.g. git)
RUN apt-get install -y git build-essential cmake gcc pkg-config

# From https://github.com/MatiMoreyra/opencv-docker/blob/master/Dockerfile
# Clone, build and install OpenCV
# RUN git clone https://github.com/opencv/opencv.git
# RUN mkdir /opencv/build && \
#     cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -S /opencv -B /opencv/build 
# RUN make -C /opencv/build -j"$(nproc)"
# RUN make -C /opencv/build install && rm -rf /opencv

# OpenCV binaries instead?
RUN apt install -y libopencv-dev

# Install python opencv
RUN pip3 install opencv-python

WORKDIR /usr/local
ENV QTWEBENGINE_DISABLE_SANDBOX=1
ENV WEBOTS_HOME /usr/local/webots
ENV PATH /usr/local/webots:${PATH}

# Set a user name to fix a warning
ENV USER root
# Set python path 
ENV PYTHONPATH="${PYTHONPATH}:/usr/local/webots/lib/controller/python/"
RUN mkdir -p "/tmp/webots/root"

CMD ["/bin/bash"]