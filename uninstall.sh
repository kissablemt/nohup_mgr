#!/bin/bash

# 获取当前脚本所在的绝对路径
script_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# 删除 /usr/local/bin/nh 符号链接
if [ -L "/usr/local/bin/nh" ]; then
    unlink "/usr/local/bin/nh"
    echo "Removed /usr/local/bin/nh"
else
    echo "Symbolic link /usr/local/bin/nh does not exist"
fi

# 删除 /usr/local/bin/nhl 符号链接
if [ -L "/usr/local/bin/nhlog" ]; then
    unlink "/usr/local/bin/nhlog"
    echo "Removed /usr/local/bin/nhlog"
else
    echo "Symbolic link /usr/local/bin/nhlog does not exist"
fi

# 删除 /usr/local/bin/nhmgr 符号链接
if [ -L "/usr/local/bin/nhmgr" ]; then
    unlink "/usr/local/bin/nhmgr"
    echo "Removed /usr/local/bin/nhmgr"
else
    echo "Symbolic link /usr/local/bin/nhmgr does not exist"
fi

# 删除 /usr/local/bin/nhmgr 符号链接
if [ -L "/usr/local/bin/nhkill" ]; then
    unlink "/usr/local/bin/nhkill"
    echo "Removed /usr/local/bin/nhkill"
else
    echo "Symbolic link /usr/local/bin/nhkill does not exist"
fi
