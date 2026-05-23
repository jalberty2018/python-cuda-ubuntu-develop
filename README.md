[![Docker Image Version](https://img.shields.io/docker/v/ls250824/python-pytorch-cuda-ubuntu-develop)](https://hub.docker.com/r/ls250824/python-pytorch-cuda-ubuntu-develop)

# Python PyTorch CUDA develop Image

A develop Docker base image for PyTorch with CUDA support.

## Image setup

- [Nvidia CUDA](https://hub.docker.com/r/nvidia/cuda/tags?name=12)
- [Pytorch.org](https://pytorch.org)
- [Triton](https://triton-lang.org/main/index.html)

| Component | Version              |
|-------|------|
| OS        | `Ubuntu v24.04 x86_64` |
| Python    | `3.13.x`             |
| PyTorch   | `2.9.0`              |
| CUDA      | `12.8.1`             |
| Triton    | `3.5.1`               |

## Available Images

### Pytorch 2.9.1

Base Image: nvidia/cuda:12.8.1-cudnn-runtime-ubuntu24.04

Custom Build: 

```bash
docker pull ls250824/python-pytorch-cuda-ubuntu-develop:23052026
```

## Building the Docker Image

You can build and push the image to Docker Hub using the `build-docker.py` script.

### Build Script Options

| Option         | Description                                         | Default                |
|----------------|-----------------------------------------------------|------------------------|
| `--username`   | Docker Hub username                                 | Current user           |
| `--tag`        | Tag to use for the image                            | Today's date           |
| `--latest`     | If specified, also tags and pushes as `latest`      | Not enabled by default |

### Build & Push Command

Run the following command to clone the repository and build the image:

```bash
git clone https://github.com/jalberty2018/python-pytorch-cuda-ubuntu-develop.git
cp python-pytorch-cuda-ubuntu-develop/build-docker.py ..
python3 build-docker.py \
--username=<your_dockerhub_username> \
--tag=<custom_tag> \ 
python-pytorch-cuda-ubuntu-develop
```

Note: If you want to push the image with the latest tag, add the --latest flag at the end.
