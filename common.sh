LOG_FILE="/tmp/expense.log"

Check_Status() {
  if [ $1 -eq 0 ]; then
    echo SUCCESS
  else
    echo FAIL
  fi
}
App_PreReq() {
  Print_Task_Heading "Clean the Old Content"
  rm -rf ${app_dir} &>>$LOG
  Check_Status $?

  Print_Task_Heading "Create App Directory"
  mkdir ${app_dir} &>>$LOG
  Check_Status $?

  Print_Task_Heading "Download App Content"
  curl -o /tmp/${component}.zip https://expense-artifacts.s3.amazonaws.com/expense-${component}-v2.zip &>>$LOG
  Check_Status $?

  Print_Task_Heading "Extract App Content"
  cd ${app_dir} &>>$LOG
  unzip /tmp/${component}.zip &>>$LOG
  Check_Status $?
}