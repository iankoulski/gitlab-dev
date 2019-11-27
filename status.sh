#!/bin/bash

. .env

docker ps -a | grep ${GITLAB_CONTAINER_NAME}


