LOG_FILE="/tmp/expense.log"

echo "Disabling default nodejs Version Module"
dnf module disable nodejs -y &>> "$LOG_FILE"
if [ $? -ne 0 ]; then echo "FAILED: Disable nodejs module"; exit 1; fi
echo "SUCCESS: Disable nodejs module"

echo "Enabling nodejs:20"
dnf module enable nodejs:20 -y &>> "$LOG_FILE"
if [ $? -ne 0 ]; then echo "FAILED: Enable nodejs:20"; exit 1; fi
echo "SUCCESS: Enable nodejs:20"

echo "Installing Nodejs"
dnf install nodejs -y &>> "$LOG_FILE"
if [ $? -ne 0 ]; then echo "FAILED: Install nodejs"; exit 1; fi
echo "SUCCESS: Install nodejs"

echo "Adding Application User"
useradd expense &>> "$LOG_FILE"
# Check if user already exists (grep returns 0 if found)
if [ $? -ne 0 ]; then echo "FAILED: Add expense user"; exit 1; fi
echo "SUCCESS: Add expense user"

echo "Copying Backend Service file"
cp backend.service /etc/systemd/system/backend.service &>> "$LOG_FILE"
if [ $? -ne 0 ]; then echo "FAILED: Copy backend.service"; exit 1; fi
echo "SUCCESS: Copy backend.service"