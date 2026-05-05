source common.sh
LOG_FILE="/tmp/expense.log"


echo "Disabling default nodejs Version Module"
dnf module disable nodejs -y &>>$LOG_FILE
Check_Status $?

echo "Enabling nodejs:20"
dnf module enable nodejs:20 -y &>> "$LOG_FILE"
Check_Status $?

echo "Installing Nodejs"
dnf install nodejs -y &>> "$LOG_FILE"
Check_Status $?

echo "Adding Application User"
useradd expense &>> "$LOG_FILE"
# Check if user already exists (grep returns 0 if found)
Check_Status $?

echo "Copying Backend Service file"
cp backend.service /etc/systemd/system/backend.service &>> "$LOG_FILE"
Check_Status $?