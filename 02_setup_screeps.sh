#!/bin/bash

set -euxo pipefail

sudo adduser --disabled-password --gecos "" screeps
sudo su screeps
cd /home/screeps

mkdir -p world
cd /home/screeps/world
npm install -g --unsafe-perm screeps
npx screeps init
npm install screepsmod-mongo screepsmod-auth screepsmod-admin-utils screepsmod-features
npx screeps start --steam_api_key $1

# Setup the screeps service.
mv /tmp/screeps-world.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start screeps-world
sudo systemctl enable screeps-world
