#!/bin/bash

# Name:        provision.sh
# Description: Provision with the Puppet manifest.
# Author:      Nick Schuch

export FACTER_node=ha

DIR='/tmp/packaging/puppet'

cd $DIR && bundle install --path vendor/bundle
cd $DIR && bundle exec librarian-puppet install
cd $DIR && sudo -E bundle exec puppet apply --modulepath $DIR/modules --hiera_config=$DIR/etc/hiera.yaml $DIR/site.pp
