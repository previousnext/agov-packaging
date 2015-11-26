#!/bin/bash

# Name:        install.sh
# Description: Install the aGov site.
# Author:      Nick Schuch

BASE=/data

VERSION=8.x-1.0-alpha1
PROFILE=agov

# Package.
curl http://ftp.drupal.org/files/projects/agov-$VERSION-core.tar.gz | tar xvz
mv agov-$VERSION $BASE/app

# Files.
mkdir -p $BASE/app/sites/default/files/tmp $BASE/app/sites/default/private
chown -R www-data:www-data $BASE/app/sites/default/files $BASE/app/sites/default/private

# Configuration.
cp $BASE/app/sites/default/default.services.yml $BASE/app/sites/default/services.yml
cp $BASE/app/sites/default/default.settings.php $BASE/app/sites/default/settings.php
chown www-data:www-data $BASE/app/sites/default/services.yml
chown www-data:www-data $BASE/app/sites/default/settings.php

# Composer.
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
chmod a+x /usr/local/bin/composer

# Drush.
composer global require drush/drush:8.0.0-rc2
sudo ln -s $HOME/.composer/vendor/bin/drush /usr/local/bin/drush
