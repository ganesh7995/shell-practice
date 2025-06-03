USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIP_NAME="$(echo $0 |cut -d "." -f1)"
LOG_FILE="$LOGS_FOLDER/$SCRIP_NAME.log"
mkdir -p $LOGS_FOLDER
echo "script executing date:$(date)" |tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR $N: please run with root access" |tee -a $LOG_FILE
    exit 1
else
    echo "you are already root user" |tee -a $LOG_FILE
fi

VALIDATE (){
    if [ $1 -eq 0 ]
    then 
        echo -e "installing $2 is ..... $G SUCCESS $N" |tee -a $LOG_FILE
    else
        echo -e "installing $2 is ....$R Failed $N"
    exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "need to install my sql" |tee -a $LOG_FILE

dnf install mysql -y &>>$LOG_FILE

VALIDATE $? "mysql" 

else
    echo -e  " $Y already mysql installed $N" |tee -a $LOG_FILE
fi
