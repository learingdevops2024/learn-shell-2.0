souce common.sh
mysql_root_password=$1
if [-z "${mysql_root_password}" ]; then
  echo Input Password Missing
  exit 1
fi

Print_Task_Heading "install nginx"
dnf install mysql-server -y &>>LOG_FILE
Check_Status $?

Print_Task_Heading "start mysql"
systemctl enable mysqld &>>LOG_FILE
systemctl start mysqld &>>LOG_FILE
Check_Status $?

Print_Task_Heading "password"
mysql_secure_installation --set-root-pass ${mysql_root_password} &>>LOG_FILE
Check_Status $?
