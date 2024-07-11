#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
VALIDATE(){
  if [ $1 -ne 0 ]
  then 
    echo -e " ERROR $2 $package \e[31m failed "
  else
    echo -e " $2 $package \e[32m success \e[0m "
  fi
}
if [ $ID -ne 0 ]
    then 
      echo "do with root user"
      exit 1
    else 
      echo "you are root user"
fi
for package in $@
do
    yum list installed $package
    if [ $? -ne 0 ]
     then 
     yum install $package
     VALIDATE $? "MY INSTALLATION $PACKAGE "
     else
     echo "pacckage is already installed "
     fi

done


