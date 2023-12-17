#!/bin/bash

# Create the 'nohup_mgr' folder if it doesn't exist
mgr_root="/tmp/nohup_mgr"
mkdir -p $mgr_root

if [ -z "$(ls -A "$mgr_root")" ]; then
   echo "Empty"
   exit 1
fi

# Process command line parameters to check if you need to clear the killed PID file
clear_files=false
if [ "$1" == "--clear" ] || [ "$1" == "-c" ]; then
  clear_files=true
fi

# Get all pid files
pid_files=("$mgr_root"/*)

for pid_file in "${pid_files[@]}"; do
  pid=$(basename "$pid_file")
  start=$(cat "$pid_file/start")
  cmd=$(cat "$pid_file/cmd")
  log=$(cat "$pid_file/log")

  if ps -p "$pid" >/dev/null; then
    status="\e[32m[alive]\e[0m"
    # Get the real start time of the process
    start=$(ps -p "$pid" -o etimes | awk 'BEGIN{now=systime()} {$1=strftime("%Y-%m-%d %H:%M:%S %A", now-$1)} END{print $1}')  
    # Get the full command of the process
    cmd=$(ps -p "$pid" -o cmd=)
  else
    status="\e[31m[kill]\e[0m"
    if [ "$clear_files" == true ]; then
      rm -rf "$pid_file"
    fi
  fi

  echo -e "PID \e[36m$pid\e[0m $status" "\e[35m$start\e[0m"
  # echo -e "    nohup \e[33m$cmd\e[0m > \e[34m$log\e[0m 2>&1 &"
  echo -e "    CMD: \e[33m$cmd\e[0m"
  echo -e "    LOG: \e[34m$log\e[0m"
  echo -e ""
done