#! /bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

REMOVE_INTERMIDIATE_CONTAINERS=${REMOVE_INTERMIDIATE_CONTAINERS:---rm}

BASE_IMAGE_NAME=${JRE_BASE_IMAGE_REPOSITORY:-debian}
BASE_IMAGE_TAG=${JRE_BASE_IMAGE_TAG:-1.0}
BASE_DOCKERFILE_DIR=${DEBIAN_DOCKERFILE_DIR:-${DIR}/../debian}
IMAGE_NAME="jre"
IMAGE_TAG="1.0"

echo "REPOSITORY PREFIX: $REPOSITORY_PREFIX"

image_name=""
image_tag=""
docker_context=""
build_image() {
    if [ -z ${REPOSITORY_PREFIX} ]; then
        image_fullname="${image_name}:${image_tag}"
    else
        image_fullname="${REPOSITORY_PREFIX}/${image_name}:${image_tag}"
    fi
    docker build \
        --tag "${image_fullname}" \
        ${REMOVE_INTERMIDIATE_CONTAINERS} \
        ${docker_context}
}

main() {
    image_name=${BASE_IMAGE_NAME}
    image_tag=${BASE_IMAGE_TAG}
    docker_context=${BASE_DOCKERFILE_DIR}
    build_image
    image_name=${IMAGE_NAME}
    image_tag=${IMAGE_TAG}
    docker_context=${DIR}
    build_image
}

main