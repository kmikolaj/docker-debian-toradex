#!/bin/bash

cd $(dirname $0)

SHARED=$HOME/workspace/build
CONTAINER=build-colibri-t20
IMAGE=kmikolaj/build-colibri-t20:V2.3

if docker inspect $CONTAINER >/dev/null 2>&1; then
    echo -e "\nINFO: Reattaching to running container $CONTAINER\n"
    docker start -i $CONTAINER
else
    echo -e "\nINFO: Creating a new container from image $IMAGE\n"
    #mkdir -p $SHARED
    #docker volume create --opt type=none --opt device=$SHARED --opt o=bind oe
    docker volume create oe
    docker run -t -i \
    --volume=oe:/home/bob/oe-core \
    --name=$CONTAINER \
    $IMAGE
fi

exit $?
