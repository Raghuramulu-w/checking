#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then 
 echo "error:run with root access"
 exit 1
else
 echo "you are root user"
fi
yum install mysql -y