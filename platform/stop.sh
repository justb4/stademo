#!/bin/bash
#
# Stops all assets (mainly Docker containers) for stademo demo services.
# Just van den Broecke - 2019
#

script_dir=${0%/*}

pushd ${script_dir}/../services
	stop.sh
popd

