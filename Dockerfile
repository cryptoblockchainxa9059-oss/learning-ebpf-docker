FROM ubuntu:latest

RUN apt-get update && \
  apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  clang \
  llvm \
  jq \
  libelf-dev \
  libpcap-dev \
  libbfd-dev \
  libssl-dev \
  binutils-dev \
  build-essential \
  make \
  linux-tools-common \
  linux-tools-xilinx-6.8 \
  linux-headers-6.8.0-1019-xilinx \
  linux-image-extra-virtual \
  iproute2 \
  bpfcc-tools \
  python3-pip \
  vim \
  git \
  file

RUN mkdir /src
WORKDIR /src

RUN git clone --recurse-submodules https://github.com/lizrice/learning-ebpf
RUN cd learning-ebpf/libbpf/src && make install

RUN git clone --recurse-submodules https://github.com/libbpf/bpftool.git
RUN cd bpftool/src && make install
