#!/bin/bash

DOCKER_CMD="${DOCKER_CMD:-podman}"
JEKYLL_IMAGE="${JEKYLL_IMAGE:-jekyll/builder}"

set -x

mkdir .jekyll-cache

${DOCKER_CMD} \
    run \
    --rm \
    -it \
    --volume="/mnt${PWD}/docs:/docs" \
    --volume="/mnt${PWD}/.jekyll-cache:/.jekyll-cache" \
    -p 4000:4000 \
    ${JEKYLL_IMAGE} \
    bash

#    jekyll \
#    build \
#    -s "/docs" \
#    -d "_site" \

#     --volume="/mnt${PWD}:/srv" \
