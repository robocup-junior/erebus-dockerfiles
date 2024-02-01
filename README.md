# Erebus Dockerfiles

This repository is used to create a Docker image to run Erebus controller code in separate Docker containers for ease of installation.

This image is intended as a base to use for creating your own docker images. You can see examples for python and C++ in the [examples](https://gitlab.com/rcj-rescue-tc/erebus/erebus-dockerfiles/-/blob/main/examples) folder. 

Please read the [getting started](./getting_started.md) documentation for further information.

## Explanation

The image will install the needed Webots files, along with OpenCV dependencies for Python and C++. The default work directory is set as `/user/local/`.

Note: Running any GUI, such as OpenCV show image, will not work by default since no graphical server is set up within the container.

### Use from Docker hub

You can pull the image from Docker hub:

```bash
docker pull alfredroberts/erebus
```

### Building from Dockerfile

You can build the image with the following command:

``` bash
docker build . --tag alfredroberts/erebus [--build-arg WEBOTS_VERSION=R2023b] [--build-arg WEBOTS_PACKAGE_PREFIX=_ubuntu-22.04]
```
