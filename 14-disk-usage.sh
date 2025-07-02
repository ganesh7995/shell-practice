#! /bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #Usually its 75%
MSG=""
IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7F}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High disk usage on $PARTITION : $USAGE \n"
    fi
done <<< $DISK_USAGE

#echo -e $MSG

sh mail.sh "DevOps team" "Disk Utilsation" "$IP" "$MSG" "ganeshaa7995@gmail.com" "ALERT-High Disk Utlisation"