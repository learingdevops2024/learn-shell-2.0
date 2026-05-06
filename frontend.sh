source ./common.sh
app_dir=/usr/share/nginx/html
component=frontend

Print_Task_Heading "install nginx"
dnf install nginx -y &>>$LOG_FILE
Check_Status $?

Print_Task_Heading "Copy Expence Nginx File"
cp expence.conf /etc/nginx/default.d/expence.conf &>>$LOG_FILE
Check_Status $?

App_PreReq

Print_Task_Heading "Restart nginx"
systemctl enable nginx &>>$LOG_FILE
systemctl restart nginx &>>$LOG_FILE
Check_Status $?