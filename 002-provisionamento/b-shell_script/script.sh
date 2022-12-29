#!/bin/bash

apt-get update
apt-get install -y nginx
service nginx restart
