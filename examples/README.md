# Examples

In this directory are example controller projects for Python and C++ to show how the Erebus Dockerfile image can be used to run code.

## Running a container

To build and run a container for one of these projects, run the following:

With the working directory being `cpp/` or `python/`, to build the image, run:

``` bash
docker build --tag my_awesome_controller .
```

To run a container:

> As a current limitation, since the docker container uses Webots extern controllers, so you must manually set your LAN ip as an environment variable, e.g: 192.128.1.1

```bash
docker run --env EREBUS_SERVER=my.ip.address my_awesome_controller
```
