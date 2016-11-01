#!/bin/bash
# This file sets up the docker machine for containers to use
set -eu
subs=$1
config=$2

# Create machine
docker-machine create --driver azure --azure-subscription-id $subs --azure-location ukwest --azure-resource-group datadockerdisconbobulating --azure-image canonical:UbuntuServer:16.04.0-LTS:latest datadocker

# Copy and execute azure plugin installation script on machine
docker-machine scp azure-file-plugin.sh datadocker:~
docker-machine scp $config datadocker:~
docker-machine ssh datadocker sudo ./azure-file-plugin.sh $config

# ssh onto machine, switch context to machine
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env datadocker)

# Create azure volumes
docker volume create --name logs -d azurefile -o share=logs
docker volume create --name dbs -d azurefile -o share=dbs
