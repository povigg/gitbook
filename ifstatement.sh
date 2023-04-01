#!/bin/bash

read -p "Enter a number: " NUM
echo

if [ $NUM -gt 100 ]
then
    echo "your numer is $NUM"
    sleep 2
    echo "Your number is greater than 100"
    echo
    date
fi

echo 'Script execution completed'