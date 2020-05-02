#!/bin/bash

# usage
SCRIPT_FILE=`basename $0`
function usage()
{
  echo "usage: ${SCRIPT_FILE} docker/nvidia-docker" 1>&2
}

# arguments
if [ $# -ne 1 ]; then
  usage
  exit 1
fi
DOCKER_CMD=$1

# constant
CONTAINER_NAME=kaggle-titanic
CONTAINER_IMAGE=kaggle-titanic
HOST_PORT=18888
CONTAINER_PORT=8888

# main
${DOCKER_CMD} run --name ${CONTAINER_NAME} \
  --privileged \
  --entrypoint bash \
  -v $(pwd)/../../:/opt/kaggle-titanic/ \
  -p ${HOST_PORT}:${CONTAINER_PORT} \
  -it ${CONTAINER_IMAGE}
