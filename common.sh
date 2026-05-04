check_status() {
  if [ $1 -eq 0 ]; then
    echo SUCCESS
  else
    echo FAIL
  fi
}