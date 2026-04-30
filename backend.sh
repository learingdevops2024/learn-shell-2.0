
echo Disable default nodejs Version Module
dnf module disable nodejs -y &>/tmp/expense.log
dnf module enable nodejs:20 -y &>/tmp/expense.log
echo$?

echo Install Nodejs
dnf install nodejs -y &>/tmp/expense.log
echo$?

echo Adding Application User
useradd expense &>/tmp/expense.log
echo$?

echo copy Backend Service file
cp Backend.service /etc/systemd/system/backend.service &>/tmp/expense.log
echo$?

echo Clean up the old content
rm -rf/app &>/tmp/expense.log
echo$?

echo Create App Directory
mkdir /app &>/tmp/expense.log
echo$?

echo Download App Content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip &>/tmp/expense.log
echo$?

echo Extract App Content
cd /app &>/tmp/expense.log
unzip /tmp/backend.zip &>/tmp/expense.log
echo$?

echo Download Nodejs Dependencies
cd /app &>/tmp/expense.log
npm install &>/tmp/expense.log
echo$?

echo enable-start backend
systemctl daemon-reload &>/tmp/expense.log
systemctl enable backend &>/tmp/expense.log
systemctl start backend &>/tmp/expense.log
echo$?

echo Install mysql
dnf install mysql -y &>/tmp/expense.log
mysql -h 172.31.40.213 -uroot -pExpenseApp@1 < /app/schema/backend.sql
echo$?