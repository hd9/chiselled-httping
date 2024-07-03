#!/bin/bash

echo "Packing our rock..."
rockcraft pack

printf "\n\nUploading our rock to our local Docker registry...\n"
rockcraft.skopeo --insecure-policy copy oci-archive:httping_latest_amd64.rock docker-daemon:httping:latest

printf "\n\nRunning our rock...\n"
docker run --rm httping:latest exec httping -c 3 google.com

