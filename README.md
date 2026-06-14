[![Docker Image Version](https://img.shields.io/docker/v/ls250824/python-cuda-ubuntu-develop)](https://hub.docker.com/r/ls250824/python-cuda-ubuntu-develop)

# Python CUDA Develop Image

Base image for CUDA/Python workloads that need compiler tools, CUDA development headers, and a Python virtual environment.

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

The Dockerfile uses the CUDA **devel** image, not the runtime image. This is intentional because downstream images may need compilers, headers, CMake, Ninja, and CUDA libraries while installing Python packages with native extensions.

## Included tooling

- Build tools: `build-essential`, `cmake`, `ninja-build`, `pkg-config`
- Source control: `git`, `git-lfs`
- Python packaging: `pip`, `setuptools`, `wheel`, `packaging`, `build`, `ninja`
- Media/system libraries: `ffmpeg`, `libsndfile1`, `libgl1`, `libglib2.0-0`, `libopenblas-dev`
- Remote/admin utilities: `openssh-server`, `openssh-client`, `tmux`, `vim`, `nano`, `mc`, `htop`, `nvtop`, `lshw`, `pciutils`, `jq`, `ncdu`, `unzip`, `7zip`, `age`, `lsof`

PyTorch is not installed in this base image. Downstream images install their own Python requirements.

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

## Building the Docker image

You can build and push the image to Docker Hub using the `build_docker.py` script.

| Option | Description | Default |
|--------|-------------|---------|
| `--username` | Docker Hub username | `name` |
| `--tag` | Tag to use for the image | Today's date |
| `--latest` | Also tags and pushes as `latest` | Not enabled |

```bash
git clone https://github.com/jalberty2018/python-cuda-ubuntu-develop.git
cp python-cuda-ubuntu-develop/build_docker.py ..

python build_docker.py \
--username=<your_dockerhub_username> \
--tag=<custom_tag> \
python-cuda-ubuntu-develop
```

Add `--latest` to also push the `latest` tag.
