source ./common.sh
app_dir=/usr/share/nginx/html
component=frontend

Print_Task_Heading "install nginx"
dnf install nginx -y &>>$LOG_FILE
check_status $?

Print_Task_Heading "Copy Expence Nginx File"
cp expence.conf /etc/nginx/default.d/expence.conf &>>$LOG_FILE
check_status $?

App_PreReq

Print_Task_Heading "Restart nginx"
systemctl enable nginx &>>$LOG_FILE
systemctl restart nginx &>>$LOG_FILE
check_status $?