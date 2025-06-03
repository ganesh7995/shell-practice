USERID=$( id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:run with root user"
    exit1
else
    echo "your already root user"
fi

VALIDATION () {
if [ $1 -eq 0 ]
then
    echo "installation $2 is ... SUCCESS"

else
    echo "installation $2 is ... FAILED"

    exit1
fi

}

dnf list install nginx

if [ $? -eq 0 ]

then
    echo "need to install nginx in your system"
    
dnf install nginx -y

VALIDATION $? "nginx"

else
    echo "nginx already installed in your system"
   exit1
fi