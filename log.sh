#!/bin/bash
ID=$(id -u)
VALIDATE(){
    if [$? -ne 0 ]
    then 
        echo "ERROR : installation fail"
    else
        echo "installation success"
    fi
}
if [$ID -ne 0]
then 
    echo "proceed with root user"
    exit 1
else
    echo "you are root user welcome"
fi
    yum install mysql -y
    VALIDATE $? "my installation"