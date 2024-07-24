#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Timestamp=$(date +%F-%H-%M-%S)
VALIDATE(){
    if [ $1 -ne 0 ]
     then
        echo -e "$R  $2 failed"
      else
        echo -e "$G $2 success"
    fi  
}
#checking root user or not
if [ $ID -ne 0 ]
 then 
    echo -e "$R ERROR do with root user"
    exit 1
else 
    echo -e "$G you are root user"
fi
cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "MONGO COPYING"
dnf install mongodb-org -y 
VALIDATE $? "mongodbinstall"
systemctl enable mongod
VALIDATE $? "enabling mongodb"
systemctl restart mongod
VALIDATE $? "reatarting mongod"
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
VALIDATE $? "remote update"
systemctl restart mongod
VALIDATE $? "restart success"