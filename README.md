# Erebus Dockerfiles

This repository is used to create a Docker image to run Erebus controller code in separate Docker containers for ease of installation.

This image is intended as a base to use for creating your own docker images. You can see examples for python and C++ in the [examples](https://gitlab.com/rcj-rescue-tc/erebus/erebus-dockerfiles/-/blob/main/examples) folder.

The image will install the needed Webots files, along with OpenCV dependencies for Python and C++. The default work directory is set as `/user/local/`.

## Use from Docker hub - CURRENTLY UNAVAILABLE

You can pull the image from Docker hub:

```bash
docker pull alfredroberts/erebus
```

## Building from Dockerfile

You can build the image with the following command:

``` bash
docker build . --tag alfredroberts/erebus [--build-arg WEBOTS_VERSION=R2023b] [--build-arg WEBOTS_PACKAGE_PREFIX=_ubuntu-22.04]
```
