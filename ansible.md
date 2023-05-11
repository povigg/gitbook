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

<figure><img src=".gitbook/assets/image (10) (1).png" alt=""><figcaption><p>Playbook example</p></figcaption></figure>

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

<figure><img src=".gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

### Ad Hoc

cmd tool to automate a single task.

e.g. to copy file from ansible server to webserver:

```
/ansible_project/task2$ ansible -i inventory -m copy -a "src=index.html dest=/var/www/html/index.html" web01 --become
```

### Variables

Variables priority:

> 1. command line values (for example, `-u my_user`, these are not variables)
> 2. role defaults (defined in role/defaults/main.yml) [1](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id14)
> 3. inventory file or script group vars [2](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id15)
> 4. inventory group\_vars/all [3](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id16)
> 5. playbook group\_vars/all [3](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id16)
> 6. inventory group\_vars/\* [3](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id16)
> 7. playbook group\_vars/\* [3](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id16)
> 8. inventory file or script host vars [2](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id15)
> 9. inventory host\_vars/\* [3](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id16)
> 10. playbook host\_vars/\* [3](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id16)
> 11. host facts / cached set\_facts [4](https://docs.ansible.com/ansible/latest/playbook\_guide/playbooks\_variables.html#id17)
> 12. play vars
> 13. play vars\_prompt
> 14. play vars\_files
> 15. role vars (defined in role/vars/main.yml)
> 16. block vars (only for tasks in block)
> 17. task vars (only for the task)
> 18. include\_vars
> 19. set\_facts / registered vars
> 20. role (and include\_role) params
> 21. include params
> 22. extra vars (for example, `-e "user=my_user"`)(always win precedence)

* Variables in inventory file

```
---
- name: Setup Webserver
  hosts: websrvgrp
  become: yes
  vars:
    dbname: PovDB
    dbuser: povilas
    dbpass: povilas
  tasks:
# debug options:  
    - debug:
        var: dbname

    - debug:
        msg: "Value of dbuser is {{dbuser}}"
```

* Variables within the project in the group\_vars/all file

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

* Groups in the inventory file have their variables defined in group\_vars folder:

<figure><img src=".gitbook/assets/image (10).png" alt=""><figcaption><p>variables</p></figcaption></figure>

<figure><img src=".gitbook/assets/image (11).png" alt=""><figcaption><p>output</p></figcaption></figure>

### Fact variables

{% embed url="https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html" %}

Used to retrieve system info about remote hosts

### Handlers

Used to run a task only when there is a change made

{% embed url="https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_handlers.html#handlers" %}

### Roles

Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content in roles, you can **easily reuse** them and **share** them **with other users**.

Community Roles: [https://galaxy.ansible.com/](https://galaxy.ansible.com/)



<figure><img src=".gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>
