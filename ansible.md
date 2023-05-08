# Ansible

Ansible documentation: [https://docs.ansible.com/](https://docs.ansible.com/)

* Ansible is agentless. Control machine (which has Ansible installed) only need SSH access to target servers
* Ansible is using **Modules**. **Small programs that do actual work**. They get sent from the control machine to the target server, **do 'they work' and get removed**
* Modules are **granual**. One module is for one specific task
* Ansible uses YAML

### Ansible Playbooks

* Playbooks are written in YAML format and **define a series** (**modules**) of tasks that need to be executed **in a specific order**
* Playbook contains one or more plays
* Playbook describes:
  * **how** and in **which** order
  * at what **time** and **where** (on which machines)
  * **what** (the modules) should be executed

<figure><img src=".gitbook/assets/image (10).png" alt=""><figcaption><p>Playbook example</p></figcaption></figure>

<figure><img src=".gitbook/assets/image (5).png" alt=""><figcaption><p>One 'Play'</p></figcaption></figure>

### Ansible Inventory List

* File that keeps **list** of Inventory. All **machines** that are **involved** in task **executions**
* Entries in the file can be **defined** as **IP address** or **Hostname**
* You can **group** multiple entries and refference the group

<figure><img src=".gitbook/assets/image (13).png" alt=""><figcaption><p>Inventory list</p></figcaption></figure>

### Creating first ansible inventory file

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

### Ad Hoc

cmd tool to automate a single task.

e.g. to copy file from ansible server to webserver:

```
/ansible_project/task2$ ansible -i inventory -m copy -a "src=index.html dest=/var/www/html/index.html" web01 --become
```
