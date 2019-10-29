#!/bin/bash
#
# This stops all service components for geoqos stack
#
# Just van den Broecke - 2017
#

SCRIPT_DIR=${0%/*}

SERVICES="gost traefik"

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./stop.sh
	popd
done

# last remove the Docker network
docker network rm geoqos-network

./${SCRIPT_DIR}/status.sh
