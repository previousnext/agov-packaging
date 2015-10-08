#!/bin/bash

# Name:        base.sh
# Description: Install the base packages.
# Author:      Nick Schuch

# Helper function to install packages.
aptInstall() {
  COUNT=`dpkg --get-selections $1 | grep -v deinstall | wc -l`
  if [ "$COUNT" -eq "0" ]; then
    apt-get -y update > /dev/null
    apt-get -y install $1
  fi
}

# Helper function to install gems packages.
gemInstall() {
  COUNT=`gem list | grep $1 | wc -l`
  if [ "$COUNT" -eq "0" ]; then
    gem install $1
  fi
}

# Install the required packages.
sudo sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list
apt-get -y update
aptInstall curl
aptInstall make
aptInstall build-essential
aptInstall wget
aptInstall git
aptInstall ruby1.9.1-dev
aptInstall rubygems
aptInstall vim
aptInstall unzip
gemInstall bundler
