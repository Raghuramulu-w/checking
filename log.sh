#!/bin/bash
ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERROR : $2 fail "
    else
        echo "$2 success"
    fi
}
if [ $ID -ne 0 ]
then 
    echo "proceed with root user"
    exit 1
else
    echo "you are root user welcome"
fi
    yum install mysql -y
    VALIDATE $? "my sql installation"
    yum install git -y
    VALIDATE $? "my git installation"