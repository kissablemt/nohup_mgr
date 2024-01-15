#!/bin/bash

# Create the 'nohup_mgr' folder if it doesn't exist
mgr_root="/tmp/nohup_mgr"
mkdir -p $mgr_root

# Parse the command line arguments
tgt_kill="$1"

# Get all pid files
pid_files=("$mgr_root"/*)

# Initialize the counter
counter=0

for pid_file in "${pid_files[@]}"; do
  # Increment the counter
  ((counter++))

  pid=$(basename "$pid_file")
  cmd=$(cat "$pid_file/cmd")

  # If counter is equal to the target kill, then show the cmd and ask for confirmation
  if [[ $counter -eq $tgt_kill ]]; then
    echo "Process to kill: $pid"
    echo "Command running: $cmd"
    
    # Ask for confirmation
    read -p "Are you sure you want to kill this process? (y/n) " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
      echo "Killing $pid"
      kill -9 $pid
      exit 0
    else
      echo "Process not killed."
      exit 1
    fi
  fi
done
