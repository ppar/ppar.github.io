#!/bin/bash

DOCKER_CMD="${DOCKER_CMD:-podman}"
JEKYLL_IMAGE="${JEKYLL_IMAGE:-jekyll/jekyll:3.8}"

set -x

${DOCKER_CMD} \
    run \
    --rm \
    -it \
    --volume="/mnt/${PWD}/docs:/srv/jekyll" \
    -p 4000:4000 \
    ${JEKYLL_IMAGE} \
    jekyll \
    serve \
    -d /tmp

#    --volume="/mnt/$PWD/vendor/bundle:/usr/local/bundle" \
