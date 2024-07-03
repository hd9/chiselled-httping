#!/bin/bash

# avoid reusing previously successful rock
rm *.rock

echo "Packing our rock..."
rockcraft pack

printf "\nUploading our rock to our local Docker registry...\n"
rockcraft.skopeo --insecure-policy copy oci-archive:httping_latest_amd64.rock docker-daemon:httping:latest

printf "\nRunning our rock...\n"
docker run --rm httping:latest exec httping -c 3 google.com

