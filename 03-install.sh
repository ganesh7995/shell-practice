USERID=$(id -u)

if [ USERID -ne 0 ]
then
    echo -e " \e[31m ERROR:: \e[0m Please run with root access"
    exit1
else
    echo "you are running with root access"
fi