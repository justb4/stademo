#!/bin/bash
#
# This installs all assets for stademo demo services
# You must first have run ./build.sh
#
# Just van den Broecke - 2019
#

script_dir=${0%/*}


# Traditional TODO look into Upstart Way
# update-rc.d stademo defaults

cp ${script_dir}/stademo.service /lib/systemd/system/

systemctl disable stademo.service
systemctl enable stademo.service
systemctl daemon-reload

echo "READY: now start using 'systemctl start|stop stademo.service'"
