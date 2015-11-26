#!/bin/bash

# Name:        azure-ha.sh
# Description: Installs the required tools for HA hosting on Azure.
# Author:      Nick Schuch

DIR_DEFAULT=/data/app/sites/default
DIR_STORE=/tmp/packaging/conf/8/ha

# Configuration.
sudo scp ${DIR_STORE}/settings.php ${DIR_DEFAULT}/settings.php
sudo scp ${DIR_STORE}/services.yml ${DIR_DEFAULT}/services.yml

# Samba and helper scripts.
#  * Installs packages
#  * Fixes some Kernel issues
#  * Script for easy mounting
# For more information:
#   https://help.ubuntu.com/community/MountWindowsSharesPermanently
#
sudo apt-get install -y linux-generic cifs-utils
sudo update-rc.d -f umountnfs.sh remove
sudo update-rc.d umountnfs.sh stop 15 0 6 .
sudo scp ${DIR_STORE}/mount-smb /usr/local/bin/mount-smb
chmod a+x /usr/local/bin/mount-smb

# Environment variables.
sudo scp ${DIR_STORE}/setenv /usr/local/bin/setenv
chmod a+x /usr/local/bin/setenv
