LOG_FILE="/tmp/expense.log"

Check_Status() {
  if [ $1 -eq 0 ]; then
    echo SUCCESS
  else
    echo FAIL
  fi
}