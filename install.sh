#!/bin/bash

# 获取当前脚本所在的绝对路径
script_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

ln -s "$script_path/nh.sh" /usr/local/bin/nh
ln -s "$script_path/nhlog.sh" /usr/local/bin/nhlog
ln -s "$script_path/nhmgr.sh" /usr/local/bin/nhmgr
ln -s "$script_path/nhkill.sh" /usr/local/bin/nhkill
