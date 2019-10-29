#!/bin/bash
#
# This starts all service components for geoqos stack
# You must first have done ./build.sh
#
# Just van den Broecke - 2017
#

SCRIPT_DIR=${0%/*}

# first create the Docker network
docker network create --driver bridge stademo-network

SERVICES="gost traefik"

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./start.sh
	popd
done

./${SCRIPT_DIR}/status.sh
