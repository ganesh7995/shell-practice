USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIP_NAME="$(echo $0 |cut -d "." -f1)"
LOG_FILE=$(LOGS_FOLDER/SCRIP_NAME.log)
mkdir -p $LOGS_FOLDER
echo "script executing date:$(date)" |tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo "ERROR::Please run with root access"|tee -a $LOG_FILE
    exit 1
else
    echo "you are running with root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing MYSQL ...SUCCESS"|tee -a $LOG_FILE
else
    echo "Installing MYSQL... FALIED"
    exit 1
fi