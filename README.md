1. 安装
```bash
sudo ./install.sh
```

2. 无任何输出
```bash
nh watch nvidia-smi
```

3. 有日志输出, 最后的参数为日志文件
```bash
nhlog watch nvidia-smi ./logs
```

4. `nhmgr`查看nohup记录, `-c`清除已经关闭的进程

5. 卸载
```bash
sudo ./uninstall.sh
```