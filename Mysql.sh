souce common.sh

Print_Task_Heading "install nginx"
dnf install mysql-server -y &>>LOG_FILE
Check_Status $?

Print_Task_Heading "start mysql"
systemctl enable mysqld &>>LOG_FILE
systemctl start mysqld &>>LOG_FILE
Check_Status $?

Print_Task_Heading "password"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>LOG_FILE
Check_Status $?
