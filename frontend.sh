echo install nginx
dnf install nginx -y
echo $?

echo Start nginx
systemctl enable nginx
systemctl start nginx
echo$?

cp expence.conf /etc/nginx/default.d/expence.conf
echo$?
echo remove a file
rm -rf /usr/share/nginx/html/*
echo$?

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html
echo unzip
unzip /tmp/frontend.zip

systemctl restart nginx
echo$?