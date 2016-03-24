#!/usr/bin/env bash
DOCKER_MACHINE="${DOCKER_MACHINE_DEFAULT:-default}"

if [ "$(docker-machine status ${DOCKER_MACHINE})" != "Running" ]; then
  echo "Default docker machine '${DOCKER_MACHINE}' not running. Starting..."
  docker-machine start ${DOCKER_MACHINE}
  if [ "$?" == "0" ]; then
    echo "Docker machine started: '${DOCKER_MACHINE}' configured on $(docker-machine ip ${DOCKER_MACHINE})"
  else
  	echo "Problems starting docker machine '${DOCKER_MACHINE}'"
  fi
fi
eval $(docker-machine env ${DOCKER_MACHINE})
