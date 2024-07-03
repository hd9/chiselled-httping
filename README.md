# chiselled-httping
Run a chiselled httping container, also known as an
[Ubuntu Rock](https://ubuntu.com/server/docs/about-rock-images).

## Getting Started
This repo contains a quick demo on how to build an Ubuntu Rock (aka. chiselled container).

For more information on how to build your own chiselled containers,
please read [Rockcraft's documentation](https://documentation.ubuntu.com/rockcraft/en/latest/).

## Requirements
For this tutorial, make sure you have the following tools installed
(I'm assuming you're using Ubuntu as your OS):
- [Rockcraft CLI](https://snapcraft.io/rockcraft)
- [Chisel CLI](https://snapcraft.io/chisel)
- [Docker](https://snapcraft.io/docker)

## What are Chiselled Containers?
[Chiselled containers](https://github.com/canonical/chisel/) are distroless,
lightweight and secure OCI-compliant containers, built on top of Ubuntu.
This means that they are Docker/K8s compatible and great for running production
workloads due to its reduced size and much-enhanced security.

The [supported versions](https://documentation.ubuntu.com/rockcraft/en/latest/reference/rockcraft.yaml/#base)
are currently: ubuntu@20.04, ubuntu@22.04, ubuntu@24.04 or bare.

## What's a bare image?
A [bare base image](https://documentation.ubuntu.com/rockcraft/en/stable/explanation/bases/#bare-bases)
is a minimal size base image (as shown on this example),
which brings only the essential components to your container.

As we can see below, once chiselled, our Ubuntu container is only 9.7MB in size!
```
bruno@X1:~/src/chiselled-httping$ ls -lah *.rock
-rw-r--r-- 1 bruno bruno 9.7M Jun 28 12:48 httping_latest_amd64.rock
```


# Building our rock
To build this rock (chiselled container), start by pulling this repo,
checking out one of the following branches
[ubuntu-22.04](https://github.com/hd9/chiselled-httping/tree/ubuntu-22.04) or
[ubuntu-24.04](https://github.com/hd9/chiselled-httping/tree/ubuntu-24.04):\
`$ git clone -b ubuntu-22.04 https://github.com/canonical/chisel-releases`

Next, pack your rock with:\
`$ rockcraft pack`

Now push your container to your local Docker registry:\
`$ rockcraft.skopeo --insecure-policy copy oci-archive:httping_latest_amd64.rock docker-daemon:httping:latest`

And finally, run your container with:\
`$ docker run --rm httping:latest exec httping -c 3 google.com`


## Next steps
To learn how to build your own chiselled container,
please read [Rockcraft's documentation](https://documentation.ubuntu.com/rockcraft/en/latest/).
