#!/bin/bash

# Installing Dependecies
#Forward output to /dev/null to not show it on the screen
echo "###############################"
echo "Installing packages"
echo "###############################"
sudo yum install wget unzip httpd -y > /dev/null
echo

# Starting & Enabling services
echo "###############################"
echo "Install and Enable HTTPD service"
echo "###############################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo


# create temp directory
echo "###############################"
echo "Starting web deployment"
mkdir -p /tmp/webfiles
cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2109_the_card.zip > /dev/null
unzip 2109_the_card.zip >/dev/null
cp -r 2109_the_card/* /var/www/html/
echo

# restart httpd
echo "###############################"
echo "Restaring HTTPD service"
echo "###############################"
systemctl restart httpd
echo

# cleanup
echo "###############################"
echo "Removing tmp files"
echo

# service status
echo "###############################"
echo "HTTPD status:"
sudo systemctl status httpd
echo "###############################"