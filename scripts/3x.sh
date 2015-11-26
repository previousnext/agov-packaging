#!/bin/bash

# Name:        install.sh
# Description: Install the aGov site.
# Author:      Nick Schuch

BASE=/data

VERSION=7.x-3.0-alpha1
PROFILE=agov

# Package.
curl http://ftp.drupal.org/files/projects/agov-$VERSION-core.tar.gz | tar xvz
mv agov-$VERSION $BASE/app

# Files.
mkdir -p $BASE/app/sites/default/files/tmp $BASE/app/sites/default/private
chown -R www-data:www-data $BASE/app/sites/default/files $BASE/app/sites/default/private

# Configuration.
cp $BASE/app/sites/default/default.settings.php $BASE/app/sites/default/settings.php
chown www-data:www-data $BASE/app/sites/default/settings.php
