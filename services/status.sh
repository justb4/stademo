#!/bin/bash
#
# This lists status all service components for geoqos stack
# You must first have done ./build.sh
#
# Just van den Broecke - 2017
#

SCRIPT_DIR=${0%/*}

echo "Containers"
echo "=========="
docker ps

echo "Networks"
echo "========"
docker network ls

echo "Volumes"
echo "======="
docker volume ls
