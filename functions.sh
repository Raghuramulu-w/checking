#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
    then 
        echo "error:must do with root user"
          exit 1
    else
        echo "you are root user"
fi
yum install mysql -y
if [ $? -ne 0 ]
    then 
        echo "installation fail for mysql"
    else
        echo "installation success for my sql"
fi
