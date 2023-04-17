# Bash Scripting

* script file has **.sh** extension
* **#!/bin/bash** - first line of the script, tell OS which program to use to run script
* to run script you need to give its full path like /opt/scripts/firstscript.sh
* use **> /dev/null** to redirect output from the screen (not to show clutter)

### Variables-things that changes or varies based on different environment, project etc.(temp storage in the memory)

* Create variable e.g. SKILL="DevOps"
* use $ to retrieve variable: echo $SKILL

PACKAGE="httpd wget unzip"

yum install $PACKAGE -y

### Command Line Arguments

_Refer to cmdarguments.sh file_

It's possible to leave empty arguments in script and you can add it your self when runnig a script from cmd, e.g.

```
#!/bin/bash
echo "Value of 0"
echo $0

echo "Value of 1"
echo $1

echo "Value of 2"
echo $2
```

&#x20;First variable of 0 will always be file name, but we can provide 1 and 2 e.g. Jenkins, AWS and get the result:

```
[root@scriptbox scripts]# /opt/scripts/arguments.sh Jenkins AWS

Value of 0
/opt/scripts/arguments.sh
Value of 1
Jenkins
Value of 2
AWS
```

&#x20;**Special Variables**

• $0 - Name of current program (script)

• $1, $2.. - Parameter 1, 2 and so on..

• $# - Number of parameters given to script&#x20;

• $@ - List of parameters given to script  &#x20;

• $? - Exit value of last command run

• \$$ - Process ID of the current script

• $USER - The username of the user running script

• $HOSTNAME - hostname of the machine running script



### Quotes

* **single quotes** in Bash (**`'`**) is to preserve the literal value of each character within the quotes
* **double quotes** (**`"`**) preserve the literal value of all characters except for (**`$`**), (**`` ` ``**), (**`"`**), (**`\`**), and the (**`!`**)
* when using double quotes use \ to remove the speacial meaning of the next character (preserve it)

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

### Command substitution

* Takes output of the command and saves it into variable
* Achieved using \`\` or $(_cmd_)

```
[root@scriptbox ~]# UP=`uptime`
[root@scriptbox ~]# echo $UP
09:41:47 up 4 min, 1 user, load average: 0.01, 0.06, 0.04
[root@scriptbox ~]#

```

```
[root@scriptbox ~]# CURRENT_USER=$(who)
[root@scriptbox ~]# echo $CURRENT_USER
vagrant pts/0 2023-03-30 09:37 (10.0.2.2)
```

### Exporting Variables

* Exporting variable will make it available for all shells
* **export** _VARIABLE_ (this will be gone after logout from shell)

To make variable permament:

* **For user**: edit .bashrc file under user home direcoty
* **For** **everyone**: edit file **/etc/profile**
* to add variable in these files e.g\`: export SEASON="Summer"

### User Input

* Takes input from the user while executing script, storing it into variable and then uses it to execute script: **read** _variable1_
* read -p (print) - for prompt
* read -sp (suppress input) - user whill not be able to see and input

```
#!/bin/bash

echo "Enter your skills"
read SKILL

echo "Your $SKILL skill is in high demand"

read -p 'Username:' USR
read -sp 'Password:' pass

echo

echo "Welcome $USR"
```

### If statement

```
#!/bin/bash

read -p "Enter a number: " NUM
echo

# -gt (greater than)
if [ $NUM -gt 100 ]
then
    echo "your numer is $NUM"
    sleep 2
    echo "Your number is greater than 100"
    echo
    date
fi

echo 'Script execution completed'
```

* **if** to start statement, **fi** to close
*

### While

* Run for condition. As long as condition is **True**, it will run&#x20;

<pre><code><strong>#!/bin/bash
</strong>
#script runs while counter value is less than 5
#each time it's incremented by 1

counter=0

while [ $counter -lt 5 ]
do
 echo "Looping.."
 echo "Value of counter is $counter"
#incrementing by 1:
 counter=$(( $counter+1 ))
 sleep 1
done

echo "Out of the loop"
</code></pre>
