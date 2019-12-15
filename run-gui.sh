#! /bin/bash

if [ $# -ne 1 ]; then
    echo "One and only one argument must be passed"
    exit 1
fi

IMAGE_PREFIX=ssh-docker-files

CONTAINER_NAME=
IMAGE=

case "$1" in
    freeplane)
        CONTAINER_NAME=freeplane
        IMAGE=$IMAGE_PREFIX/freeplane:1.0
        ;;
    *)
        echo "unknown option $1"
        exit 1
esac

docker run -d --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME:/home/user \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/dri \
    --name $CONTAINER_NAME \
    $IMAGE