echo '
[archlinuxcn]

SigLevel = Optional TrustedOnly

Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
    ' >> "/etc/pacman.conf"
if [ $? -eq 0 ]
    then
    pacman -Syy
    pacman -S archlinuxcn-keyring
    echo -e "\033[42;30m换源已经完成\033[0m";
    else
    echo -e "\033[41;37m换源出现错误\033[0m"
fi


