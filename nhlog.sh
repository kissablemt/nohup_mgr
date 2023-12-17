#!/bin/bash

# Create the 'nohup_mgr' folder if it doesn't exist
mgr_root="/tmp/nohup_mgr"
mkdir -p $mgr_root

# Parse the command line arguments
cmd="$@"

# Extract the last string separated by spaces from cmd
last_arg="${cmd##* }"

# Remove the last argument from cmd
cmd="${cmd% $last_arg}"

# Run cmd and redirect the output to a log file
nohup $cmd >$last_arg 2>&1 &

# Get the PID of cmd
pid=$!
start=$(date +"%Y-%m-%d %H:%M:%S %A")

# If the last argument is not an absolute path, then prepend the current working directory
if [[ "$last_arg" != /* ]]; then
    last_arg="$PWD/$last_arg"
fi

# Save the command and log file paths to a file
mkdir -p $mgr_root/$pid
echo "$cmd" > "$mgr_root/${pid}/cmd"
echo "$last_arg" > "$mgr_root/${pid}/log"
echo "$start" > "$mgr_root/${pid}/start"
