#!/bin/bash

. .env

docker logs -f ${GITLAB_CONTAINER_NAME}

