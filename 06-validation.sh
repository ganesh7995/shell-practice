USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: please run with root access"
else
    echo "you are already root user"

VALIDATE (){
    if [ $1 -eq 0 ]
    then 
        echo "installing $2 is .....SUCCESS"
    else
        echo "installing $2 is ....Failed"
    exit 1
    fi
}

dnf list install mysql
if [ $? -ne 0]
then
    echo "need to install my sql"

dnf install mysql -y
VALIDATE $? "mysql"

else
    echo "already mysql installed"

fi