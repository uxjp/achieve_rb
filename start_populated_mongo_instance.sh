#!/bin/bash

IMAGE_NAME=${1:-mongo}
CONTAINER_NAME=${2:-mongodb_container}

docker build -t $IMAGE_NAME .

docker run -d --name $CONTAINER_NAME $IMAGE_NAME

sleep 5 #necessary
docker exec -it mongodb_container mongosh