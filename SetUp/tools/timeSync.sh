#导入上海时钟
#rm -f /etc/localtime
#ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#重启同步时间服务
systemctl restart systemd-timesyncd.service
systemctl status systemd-timesyncd.service

#检查时间同步状况
timedatectl

#设置硬件时间同步
#timedatectl set-local-rtc 0


