USERID=$( id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: please run with root access"
    exit 1
else
    echo "you are already root user"
fi

VALIDATION () {
if [ $1 -eq 0 ]
then
    echo "installation $2 is ... SUCCESS"
else
    echo "installation $2 is .... FAILED"
exit 1

fi
}

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "need to install python3 in your system"

dnf install python3 -y

VALIDATION $? "python3"

else
    echo "python3 already installed in your system"

fi
