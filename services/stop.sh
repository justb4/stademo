#!/bin/bash
#
# This stops all service components for stademo stack
#
# Just van den Broecke - 2019
#

SCRIPT_DIR=${0%/*}

SERVICES="gost nodered traefik"

for SERVICE in ${SERVICES}
do
	pushd ${SCRIPT_DIR}/${SERVICE}
		./stop.sh
	popd
done

# last remove the Docker network
docker network rm stademo-network

./${SCRIPT_DIR}/status.sh
