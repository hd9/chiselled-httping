#!/bin/bash

# Packing our rock
echo "Packing our rock..."
rockcraft pack

# Uploading our rock to Docker
rockcraft.skopeo --insecure-policy copy oci-archive:httping_latest_amd64.rock docker-daemon:httping:latest

# Run our rock
docker run --rm httping:latest exec httping -c 3 google.com

