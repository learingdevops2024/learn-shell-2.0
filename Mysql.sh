souce common.sh

mysql_root_password=$1
if [-z "${mysql_root_password}" ]; then
  echo Input Password Missing
  exit 1
fi

Print_Task_Heading "install mysql server"
dnf install mysql-server -y &>>LOG_FILE
Check_Status $?

Print_Task_Heading "start mysql"
systemctl enable mysqld &>>LOG_FILE
systemctl start mysqld &>>LOG_FILE
Check_Status $?

Print_Task_Heading "Setup MySQL Password"
echo 'show databases' |mysql -h mysql-dev.rdevops6a.online -uroot -p${mysql_root_password} &>>$LOG
if [ $? -ne 0 ]; then
  mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOG
fi
Check_Status $?
