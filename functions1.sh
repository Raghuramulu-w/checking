#!/bin/bash
Id=$(id -u)
VALIDATE() {
    if [ $? -ne 0 ]
    then 
        echo "installation failed "
        
    else
        echo "instalaltion success"
    fi
}
 if [ $ID -ge 0 ]
then
    echo "go with root user"
    
else
    echo "you are root user"
fi
yum install mysql1 -y
VALIDATE

yum install gitt -y
VALIDATE