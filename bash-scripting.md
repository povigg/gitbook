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

