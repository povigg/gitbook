#!/bin/bash

#using user input in this script
echo "Enter your skills"
read SKILL

echo "Your $SKILL skill is in high demand"

# -p for prompt, -sp suppress input
read -p 'Username:' USR
read -sp 'Password:' pass

echo

echo "Welcome $USR"