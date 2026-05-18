# Python PyTorch CUDA Runtime Image

A lightweight runtime Docker base image for PyTorch with CUDA support.

## Image setup

- [Nvidia CUDA](https://hub.docker.com/r/nvidia/cuda/tags?name=12)
- [Pytorch.org](https://pytorch.org)
- [Triton](https://triton-lang.org/main/index.html)

| Component | Version              |
|-------|------|
| OS        | `Ubuntu v24.04 x86_64` |
| Python    | `3.13.x`             |
| PyTorch   | `2.9.1`              |
| CUDA      | `12.8.1`             |
| Triton    | `3.5.1`               |

## Available Images

### Image 2.9.1

Base Image: nvidia/cuda:12.8.1-cudnn-runtime-ubuntu24.04

Custom Build: 

```bash
docker pull ls250824/python-pytorch-cuda-ubuntu-runtime:18052026
```