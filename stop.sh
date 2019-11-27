#!/bin/bash

. .env

docker stop ${GITLAB_CONTAINER_NAME}
docker rm ${GITLAB_CONTAINER_NAME}

