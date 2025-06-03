USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME="$(echo $0 |cut -d "." -f1)"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx")

mkdir -p $LOGS_FOLDER
echo "script executing date:$(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR $N: please run with root access" | tee -a $LOG_FILE
    exit 1
else
    echo "you are already root user" | tee -a $LOG_FILE
fi

VALIDATE (){
    if [ $1 -eq 0 ]
    then 
        echo -e "installing $2 is ..... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "installing $2 is ....$R Failed $N" | tee -a $LOG_FILE
        exit 1
    fi
}

for package in $@
do
    dnf list installed $package @>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo " $package is not installed .. need to install it" | tee -a $LOG_FILE
        dnf install $package -y @>>$LOG_FILE
        VALIDATE $? "$package"

    else
        echo -e "nothing to do $package..$Y already installed $N" | tee -a $LOG_FILE
    fi
done