#!/bin/bash

# using cmd arguments in this file
# providing argument 1 and 2 when running script manually: ./cmdarguments.sh https://www.tooplate.com/zip-templates/2131_wedding_lite.zip 2131_wedding_lite

#!/bin/bash

#URL and ARTNAME has been changed to cmd arguments 1 and 2
PACKAGE="wget unzip httpd"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2109_the_card.zip'
#ARTNAME="2109_the_card"
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

#manual arguments 1 and 2
wget $1 > /dev/null
unzip $2.zip >/dev/null
cp -r $2/* /var/www/html/
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