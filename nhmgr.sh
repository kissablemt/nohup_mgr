#!/bin/bash

# 检查pids文件夹是否存在
pids_folder="/tmp/pids"
if [ ! -d "$pids_folder" ]; then
  echo "pids文件夹不存在"
  exit 1
fi

# 检查pids文件夹是否为空
if [ -z "$(ls -A "$pids_folder")" ]; then
   echo "no pids"
   exit 1
fi

# 处理命令行参数，检查是否需要清除killed的PID文件
clear_files=false
if [ "$1" == "--clear" ] || [ "$1" == "-c" ]; then
  clear_files=true
fi

# 获取pids文件夹下所有pid文件的路径
pid_files=("$pids_folder"/*)

# 循环遍历每个pid文件
for pid_file in "${pid_files[@]}"; do
  # 从文件名中提取PID
  pid=$(basename "$pid_file")

  # 检查PID是否仍在运行
  if ps -p "$pid" >/dev/null; then
    # 获取进程名字和创建时间
    cmd=$(ps -p "$pid" -o cmd=)
    # start=$(ps -p "$pid" --format "%Y-%m-%d %H:%M:%S" -o lstart=)
start=$(ps -p "$pid" -o etimes | awk 'BEGIN{now=systime()} {$1=strftime("%Y-%m-%d %H:%M:%S %A", now-$1)} END{print $1}')    
    
    echo "PID $pid: alive "
    echo "    CMD: $cmd"
    echo "    START: $start"
    
  else
    echo "PID $pid: killed"
    if [ "$clear_files" == true ]; then
      # 删除状态为"killed"的PID文件
      rm "$pid_file"
    fi
  fi
  echo -e ""
done