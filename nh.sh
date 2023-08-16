#!/bin/bash

# 创建pids文件夹
mkdir -p "/tmp/pids"

# 获取命令参数
cmd="$@"

# 运行cmd，并将输出重定向到日志文件
nohup $cmd >/dev/null 2>&1 &

# 获取cmd的PID
pid=$!

# 将pid写入到pids文件夹
echo "$pid" > "/tmp/pids/$pid"