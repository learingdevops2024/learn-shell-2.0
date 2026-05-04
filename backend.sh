LOG_FILE="/tmp/expense.log"

echo "Disabling default nodejs Version Module"
dnf module disable nodejs -y &>>$LOG_FILE
check_status $?

echo "Enabling nodejs:20"
dnf module enable nodejs:20 -y &>> "$LOG_FILE"
check_status $?

echo "Installing Nodejs"
dnf install nodejs -y &>> "$LOG_FILE"
check_status $?

echo "Adding Application User"
useradd expense &>> "$LOG_FILE"
# Check if user already exists (grep returns 0 if found)
check_status $?

echo "Copying Backend Service file"
cp backend.service /etc/systemd/system/backend.service &>> "$LOG_FILE"
check_status $?