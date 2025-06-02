USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR::Please run with root access"
    exit 1
else
    echo "you are running with root access"
fi

dnf list installed mysql 

if [ $? -ne 0 ]
then 
    echo "mysql is not installed ....need to install mysql"

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing MYSQL ...SUCCESS"
else
    echo "Installing MYSQL... FALIED"
    exit 1
fi
