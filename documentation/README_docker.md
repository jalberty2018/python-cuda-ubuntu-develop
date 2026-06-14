# Python CUDA develop image

## Image setup

| Component | Version / value |
|-----------|-----------------|
| Published image | `ls250824/python-cuda-ubuntu-develop:23052026` |
| Base image | `nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04` |
| OS | `Ubuntu 24.04 x86_64` |
| Python | `3.13.3`, compiled from source |
| Python environment | `/opt/venv` |
| CUDA | `12.8.1` |
| CUDA home | `/usr/local/cuda` |
| CUDA architectures | `80;86;89;90;120` |
| Torch arch list | `8.0;8.6;8.9;9.0;12.0` |

## Purpose

This image is a CUDA development base image for downstream AI containers. It uses the NVIDIA CUDA **devel** image so packages with native extensions can compile against CUDA and system headers.

PyTorch is not installed in this base image. Downstream images install their own Python requirements.

## Included tooling

- Build tools: `build-essential`, `cmake`, `ninja-build`, `pkg-config`
- Source control: `git`, `git-lfs`
- Python packaging: `pip`, `setuptools`, `wheel`, `packaging`, `build`, `ninja`
- Media/system libraries: `ffmpeg`, `libsndfile1`, `libgl1`, `libglib2.0-0`, `libopenblas-dev`
- Remote/admin utilities: `openssh-server`, `openssh-client`, `tmux`, `vim`, `nano`, `mc`, `htop`, `nvtop`, `lshw`, `pciutils`, `jq`, `ncdu`, `unzip`, `7zip`, `age`, `lsof`

## Environment

| Variable | Value |
|----------|-------|
| `VIRTUAL_ENV` | `/opt/venv` |
| `PATH` | `/opt/venv/bin:/usr/local/bin:$PATH` |
| `CUDA_HOME` | `/usr/local/cuda` |
| `LD_LIBRARY_PATH` | `/usr/local/cuda/lib64:${LD_LIBRARY_PATH}` |
| `PIP_NO_CACHE_DIR` | `1` |
| `CMAKE_BUILD_PARALLEL_LEVEL` | `16` |
| `FORCE_CMAKE` | `1` |

## Pull image

```bash
docker pull ls250824/python-cuda-ubuntu-develop:23052026
```
