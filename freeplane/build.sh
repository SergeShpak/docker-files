#! /bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export REMOVE_INTERMIDIATE_CONTAINERS=${REMOVE_INTERMIDIATE_CONTAINERS:---rm}
export REPOSITORY_PREFIX=${REPOSITORY_PREFIX:-ssh-docker-files}

BASE_IMAGE_NAME=${JRE_BASE_IMAGE_REPOSITORY:-jre}
BASE_IMAGE_TAG=${JRE_BASE_IMAGE_TAG:-1.0}
IMAGE_NAME="freeplane"
IMAGE_TAG="1.0"

main() {
    ${DIR}/../base-images/JRE/build.sh
    image_fullname="${REPOSITORY_PREFIX}/${IMAGE_NAME}:${IMAGE_TAG}"
    docker build --tag ${image_fullname} ${REMOVE_INTERMIDIATE_CONTAINERS} ${DIR}
}

main