# syntax=docker/dockerfile:1.7
FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHON_VERSION=3.13.3 \
    VIRTUAL_ENV=/opt/venv \
    PATH=/opt/venv/bin:/usr/local/bin:$PATH \
    CUDA_HOME=/usr/local/cuda \
    LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH} \
    PIP_NO_CACHE_DIR=1 \
    TORCH_CUDA_ARCH_LIST="8.0;8.6;8.9;9.0;12.0" \
    CUDAARCHS="80;86;89;90;120" \
    CMAKE_BUILD_PARALLEL_LEVEL=16 \
    FORCE_CMAKE=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    git-lfs \
    curl \
    wget \
    ca-certificates \
    cmake \
    ninja-build \
    pkg-config \
    ffmpeg \
    libsndfile1 \
    libgl1 \
    libglib2.0-0 \
    libopenblas-dev \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    liblzma-dev \
    uuid-dev \
    tk-dev \
    xz-utils \
    openssh-server openssh-client \
    git git-lfs \
    tmux wget vim nano mc htop curl lshw pciutils nvtop 7zip age lsof jq ncdu unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget -q https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar -xzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations --with-ensurepip=install && \
    make -j"$(nproc)" && \
    make altinstall && \
    cd / && rm -rf /tmp/Python-${PYTHON_VERSION}*

RUN python3.13 -m venv ${VIRTUAL_ENV} && \
    python -m pip install --upgrade pip setuptools wheel packaging build ninja

WORKDIR /

# Labels
LABEL org.opencontainers.image.title="Python cuda develop base image" \
      org.opencontainers.image.description="Python compiled from source" \
      org.opencontainers.image.source="https://github.com/jalberty2018/python-cuda-ubuntu-develop" \
      org.opencontainers.image.licenses="MIT"

