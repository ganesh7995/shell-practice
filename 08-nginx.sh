USERID=$( id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=$LOGS_FOLDER/$SCRIP_NAME.log
mkdir -p $LOGS_FOLDER

echo "script execution time at: $(date)" |tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:run with root user $N" |tee -a $LOG_FILE
    exit1
else
    echo -e "$G your already root user $N" |tee -a $LOG_FILE
fi

VALIDATION () {
if [ $1 -eq 0 ]
then
    echo -e "installation $2 is ... $G SUCCESS $N" |tee -a $LOG_FILE
    exit1

else
    echo -e "installation $2 is ... $R FAILED $N" |tee -a $LOG_FILE

    exit1
fi

}

dnf list installed nginx &>> $LOG_FILE

if [ $? -eq 0 ]

then
    echo -e "$Y need to install nginx in your system $N"
    
dnf install nginx -y &>> $LOG_FILE

VALIDATION $? "nginx"

else
    echo -e "$Y nginx already installed in your system $N"
   exit1
fi