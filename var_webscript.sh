#!/bin/bash

#using variables in this script
PACKAGE="wget unzip httpd"
SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2109_the_card.zip'
ARTNAME="2109_the_card"
TEMPDIR="/tmp/webfiles"

# Installing Dependecies
#Forward output to /dev/null to not show it on the screen
echo "###############################"
echo "Installing packages"
echo "###############################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Starting & Enabling services
echo "###############################"
echo "Install and Enable HTTPD service"
echo "###############################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo


# create temp directory
echo "###############################"
echo "Starting web deployment"
mkdir -p $TEMPDIR
cd $TEMPDIR

wget $URL > /dev/null
unzip $ARTNAME.zip >/dev/null
cp -r $ARTNAME/* /var/www/html/
echo

# restart httpd
echo "###############################"
echo "Restaring HTTPD service"
echo "###############################"
systemctl restart $SVC
echo

# cleanup
echo "###############################"
echo "Removing tmp files"
rm -rf $TEMPDIR
echo

# service status
echo "###############################"
echo "HTTPD status:"
sudo systemctl status $SVC
echo "###############################"