# stademo
SensorThings API demo server setup with Geodan GOST.

## Setup
Ansible is used to install, configure and maintain the entire demo server on an empty Ubuntu VM.
See [ansible README](ansible/README.md).

## Services
The following services are run, see [services](services):

* GOST with PostGIS and MQTT
* Nodered
* Traefik proxy frontend and HTTPS
