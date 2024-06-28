# chiselled-httping
Run a chiselled httping as an Ubuntu ROCK

## Getting Started
For more informatio on how to build your chiselled containers, please read [Rockcraft's documentation](https://documentation.ubuntu.com/rockcraft/en/latest/).

## Requirements
For this tutorial, make sure you have the following tools installed (we're assuming you're using Ubuntu as your OS):
- [rockcraft](https://snapcraft.io/rockcraft)
- [chisel](https://snapcraft.io/chisel)
- [docker](https://snapcraft.io/docker)

## About Chiselled Containers
[Chiselled containers](https://github.com/canonical/chisel/) are lightweight and secure OCI-compliant containers, built on top of Ubuntu. This means that they are Docker/K8s compatible and great for running production workloads due to its reduced size and enhanced security.

The [supported versions](https://documentation.ubuntu.com/rockcraft/en/latest/reference/rockcraft.yaml/#base) are currently: ubuntu@20.04, ubuntu@22.04, ubuntu@24.04 or bare.

For minimal size, you should use the `bare` base (as shown on this example), which brings only the essential components to your container. In our example, our container is only 9.7MB in size!

## Building our chiselled container
To build this container, you'll need to pull the `ubuntu-22.04` chisel database with:
$ git clone -b ubuntu-22.04 https://github.com/canonical/chisel-releases

Next, copy the slices available in this repo to the `chisel-releases/slices` folder.

And pack your rock:
`$ rockcraft pack`


As we can see below, once chiselled, our Ubuntu container is only 9.7MB in size!
```
bruno@X1:~/src/chiselled-httping_2$ ls -lah *.rock
-rw-r--r-- 1 bruno bruno 9.7M Jun 28 12:48 httping_latest_amd64.rock
```

Now push your rock to your local Docker registry:
`rockcraft.skopeo --insecure-policy copy oci-archive:httping_latest_amd64.rock docker-daemon:httping:latest`

And finally, run your container with:
`$ docker run --rm httping:latest exec httping -c 3 google.com`


## Next steps
To learn how to build your own chiselled containers, please read [Rockcraft's documentation](https://documentation.ubuntu.com/rockcraft/en/latest/).


