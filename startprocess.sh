#!/bin/bash

#script to check if process is running, if not then start it

echo "##############################"
date
#checking if httpd process is running
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
    echo "Httpd process is running"
else
    echo "Httpd process is not running"
    echo "Starting the process"
    systemctl start httpd
#checking if process was able to start
    if [ $? -eq 0 ]
    then
        echo "Process started successfully"
    else
        echo "Process start failed, please contact the admin"
    fi
fi
echo "##############################"