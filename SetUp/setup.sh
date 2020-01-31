sudo passwd root
#设置超级用户权限
#脚本1：换源
sudo bash ./ChMirror.sh
#接触安装包锁
rm /var/lib/pacman/db.lck
#脚本2：安装需要的软件
sudo bash ./Softs.sh
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m####软件安装已经完成####\033[0m"
else
    echo -e "\033[41;37m####软件安装出现错误####\033[0m"
    read -p "输入‘Y’重新运行软件安装" restart
    if [ $restart = Y ]
    then
        sudo bash ./Softs.sh
    else
        exit
    fi
fi
#脚本3：移动配置
bash ./MvConfig.sh
if [ $? -eq 0 ]
then
    cp ./KDEKeyMap $HOME/Desktop
    cp ./winIcon.svg $HOME/Desktop
    echo -e "\033[42;30m#####配置已完成#####\033[0m"
else
    echo -e "\033[41;37m#####配置出现错误#####\033[0m"
    exit
fi