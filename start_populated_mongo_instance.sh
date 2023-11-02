#!/bin/bash

IMAGE_NAME=${1:-mongo}
CONTAINER_NAME=${2:-mongodb_container}

docker build -t $IMAGE_NAME .

docker run -d -p 27017:27017 \
        --name $CONTAINER_NAME \
        $IMAGE_NAME


#sleep 5 #necessary
#docker exec -it $CONTAINER_NAME mongosh