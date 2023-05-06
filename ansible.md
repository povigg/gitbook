# Ansible

Ansible documentation: [https://docs.ansible.com/](https://docs.ansible.com/)



### Createing first ansible inventory file

Inventory file - text file with a list of hosts that Ansible will use to execute tasks

```
#host information

web01 ansible_host=172.31.21.165
web02 ansible_host=172.31.17.253
db01 ansible_host=172.31.86.159

#group information

[websrvgrp]
web01
web02

[dbsrvgrp]
db01

#nested group info. contains previous groups

[group_of_groups:children]
websrvgrp
dbsrvgrp

#variables info. provides user and ssh key

[group_of_groups:vars]
ansible_user=centos
ansible_ssh_private_key_file=webkey.pem
```

e.g. we are in 'task1' folder where we have ansible inventory file and webkey.pem that we are using **as variable**. we are runnin ansible cmd to ping all hosts within inventory file. Use **-i inventory** to tell to use this file **instead of default** ansible inv file

<figure><img src=".gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>
