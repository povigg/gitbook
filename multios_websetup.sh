#!/bin/bash

#this script is created to run httpd/apache2 service on either centos or ubuntu using if statement

#using variables in this script
#PACKAGE="wget unzip httpd"
#SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2109_the_card.zip'
ARTNAME="2109_the_card"
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then

#set variables for CentOS
    PACKAGE="httpd wget unzip"
    SVC="httpd"
    echo "###############################"
    echo "Running on CentOS, installing packages"
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
    echo

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

    #httpd status
    sudo systemctl status $SVC
    ls /var/www/html

else

#set variables for Ubuntu
PACKAGE="apache2 wget unzip"
    SVC="apache2"
    echo "###############################"
    echo "Running on CentOS, installing packages"
    echo "###############################"
    sudo apt update
    sudo apt install $PACKAGE -y > /dev/null
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
    echo

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

    #httpd status
    sudo systemctl status $SVC
    ls /var/www/html
fi