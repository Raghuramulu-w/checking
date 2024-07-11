#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%S-%M)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
  if [ $1 -ne 0 ]
  then 
    echo -e " ERROR $2  \e[31m failed "
  else
    echo -e " $2  \e[32m success \e[0m "
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
     yum install $package &>> $LOGFILE
     VALIDATE $? "MY INSTALLATION $PACKAGE "
     else
     echo "pacckage is already installed "
     VALIDATE $? "my installation $package "
     fi

done


