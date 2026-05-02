echo "Disabling default nodejs Version Module"
dnf module disable nodejs -y &>>$LOG_FILE
check_status "Disable nodejs module"

echo "Enabling nodejs:20"
dnf module enable nodejs:20 -y &>>$LOG_FILE
check_status "Enable nodejs:20"

echo "Installing Nodejs"
dnf install nodejs -y &>>$LOG_FILE
check_status "Install nodejs"

echo "Adding Application User"
useradd expense &>>$LOG_FILE
check_status "Add expense user"

echo "Copying Backend Service file"
cp backend.service /etc/systemd/system/backend.service &>>$LOG_FILE
check_status "Copy backend.service"

echo "Cleaning up old content"
rm -rf /app/* &>>$LOG_FILE
check_status "Clean /app"

echo "Creating App Directory"
mkdir -p /app &>>$LOG_FILE
check_status "Create /app"

echo "Downloading App Content"
curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/backend-v2.zip &>>$LOG_FILE
check_status "Download app content"