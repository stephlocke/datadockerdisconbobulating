#!/bin/bash
set -eu

config=$1
wget -qO /usr/bin/azurefile-dockervolumedriver https://github.com/Azure/azurefile-dockervolumedriver/releases/download/v0.5.1/azurefile-dockervolumedriver
chmod +x /usr/bin/azurefile-dockervolumedriver
wget -qO /etc/systemd/system/azurefile-dockervolumedriver.service https://raw.githubusercontent.com/Azure/azurefile-dockervolumedriver/master/contrib/init/systemd/azurefile-dockervolumedriver.service
cp $config /etc/default/
systemctl daemon-reload
systemctl enable azurefile-dockervolumedriver
systemctl start azurefile-dockervolumedriver
systemctl status azurefile-dockervolumedriver