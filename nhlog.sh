#!/bin/bash

# Get the absolute path of the current script
script_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Create the 'pids' folder
mkdir -p "/tmp/pids"

# Get the command arguments
cmd="$@"

# Extract the last string separated by spaces from cmd
last_arg="${cmd##* }"

# Remove the last argument from cmd
cmd="${cmd% $last_arg}"

# Run cmd and redirect the output to a log file
nohup $cmd >$last_arg 2>&1 &

# Get the PID of cmd
pid=$!

# Write the PID to the 'pids' folder
echo "$pid" > "/tmp/pids/$pid"

# Echo the last argument as a path
echo "$last_arg"
