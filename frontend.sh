source common.sh

Print_Task_Heading "install nginx"
dnf install nginx -y
Check_Status $?

Print_Task_Heading "Copy Expence Nginx File"
cp expence.conf /etc/nginx/default.d/expence.conf
Check_Status $?

Print_Task_Heading "CleanUp the Old Content"
rm -rf /usr/share/nginx/html/*
Check_Status $?

Print_Task_Heading "Download App Content"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
Check_Status $?

Print_Task_Heading "Extract App Content"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
Check_Status $?

Print_Task_Heading "Restart nginx"
systemctl restart nginx
Check_Status $?