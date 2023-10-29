#!bin/bash

IMAGE_NAME=${1:-mongo}

docker build -t $IMAGE_NAME .

