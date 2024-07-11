#!/bin/bash
ID=$(id -u)
R="e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ $ID -ne 0 ]
    then 
      echo "do with root user"
    else 
      echo "you are root user"
fi
for package in $@
do
    if [ $package -ne 0 ]
    then
         yum install $package -y
       else
        echo "package is success"
    fi  
    done

done


