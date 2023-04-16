#!/bin/bash

#this script copies the multios_websetup.sh to all the machines in remhosts file using scp
#then script is run using ssh cmd and providing script path
#script is deleted after execution

USR='devops'

for host in `cat remhosts`
do
    echo "########################"
    echo "Connecting to $host"
    echo "Pushing the script to $host"
    scp multios_websetup.sh $USR@$host:/tmp/
    echo "Executing the script on $host"
    ssh $USR@$host sudo /tmp/multios_websetup.sh
    ssh $USR@$host sudo rm -rf /tmp/multios_websetup.sh
    echo "########################"
done
