
echo Disable default nodejs Version Module
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
echo$?

echo Install Nodejs
dnf install nodejs -y
echo$?

echo Adding Application User
useradd expense
echo$?

echo copy Backend Service file
cp Backend.service /etc/systemd/system/backend.service
echo$?

echo Clean up the old content
rm -rf/app
echo$?

echo Create App Directory
mkdir /app
echo$?

echo Download App Content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
echo$?

echo Extract App Content
cd /app
unzip /tmp/backend.zip
echo$?

echo Download Nodejs Dependencies
cd /app
npm install
echo$?

echo enable-start backend
systemctl daemon-reload
systemctl enable backend
systemctl start backend
echo$?

echo Install mysql
dnf install mysql -y
mysql -h 172.31.40.213 -uroot -pExpenseApp@1 < /app/schema/backend.sql
echo$?