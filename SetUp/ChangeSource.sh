#先是换源
sudo passwd root
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
if [ $? -eq 0 ]
then
    echo '
[archlinuxcn]

SigLevel = Optional TrustedOnly

Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
    ' >> "/etc/pacman.conf"
    echo -e "\033[42;30m换源已经完成"
else
    echo -e "\033[41;37m出现错误\033[0m"
fi
#$?代表上一指令的执行情况