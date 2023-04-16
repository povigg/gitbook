#!/bin/bash

#add multiple users

USERNAME="Tom Andrey Tara"

for usr in $USERNAME
do
    useradd $usr
    id $usr
echo "###################"
done
