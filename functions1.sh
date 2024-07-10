#!/bin/bash
ID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo "installation failed "
        exit 1
    else
        echo "instalaltion success"
    fi
}

 if [ $ID  -ne  0  ]
then
    echo "go with root user"
    exit 1
    
else
    echo "you are root user"
fi
yum install mysql1 -y
VALIDATE

yum install gitt -y
VALIDATE