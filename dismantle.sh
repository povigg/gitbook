#!/bin/bash

#script to remove services and cleanup

sudo systemctl stop httpd
sudo rm -rf /var/www/html/*
sudo yum remove httpd wget unzip -y