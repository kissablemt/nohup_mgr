#!/bin/bash

# Create the 'nohup_mgr' folder if it doesn't exist
mgr_root="/tmp/nohup_mgr"
mkdir -p $mgr_root

# Parse the command line arguments
cmd="$@"

# Run cmd and redirect the output to a log file
nohup $cmd > /dev/null 2>&1 &

# Get the PID of cmd
pid=$!
start=$(date +"%Y-%m-%d %H:%M:%S %A")

# Save the command and log file paths to a file
mkdir -p $mgr_root/$pid
echo "$cmd" > "$mgr_root/${pid}/cmd"
echo "/dev/null" > "$mgr_root/${pid}/log"
echo "$start" > "$mgr_root/${pid}/start"
