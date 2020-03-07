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
rm /var/lib/pacman/db.lck
pacman -S fcitx fcitx-gtk3 fcitx-qt5 fcitx-configtool visual-studio-code-bin yaourt gdb typora google-chrome deepin.com.qq.im wine-wechat netease-cloud-music v2ray ttf-sarasa-gothic libinput-gestures xorg-xinput 
#fcitx-sogoupinyin
if [ $? -eq 0 ]
    then
    #oh-my-zsh
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    #安装vscode等开发工具
    yaourt -S visual-studio-code-bin
    echo -e "\033[42;30mSofts have installed\033[0m";
    else
    echo -e "\033[41;37Softs installation error\033[0m"
    read hh
    exit
fi

#触控板和v2ray的设置
cp ./configs/libinput-gestures.conf /home/$USER/.config
sudo cp ./config.json /etc/v2ray
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m#####v2ray配置已完成#####\033[0m"
else
    echo -e "\033[41;37m#####v2ray配置出现错误#####\033[0m"
    exit
fi
sudo chown $USER /etc/v2ray

#把用户加入input组
sudo gpasswd -a $USER input

#zsh设置
cp -R ~/.oh-my-zsh  /home/$USER
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m#####oh-my-zsh配置已完成#####\033[0m"
else
    echo -e "\033[41;37m#####oh-my-zsh配置出现错误#####\033[0m"
    exit
fi
cp -R ~/zsh-syntax-highlighting /home/$USER
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m#####zsh高亮配置已完成#####\033[0m"
else
    echo -e "\033[41;37m#####zsh高亮配置出现错误#####\033[0m"
    exit
fi
cp ./configs/.zshrc /home/$USER
cp ./configs/.zshrc /root

#改变用户的shell的所有者
#chmod 777 -R /home/$USER/.oh-my-zsh
chown $USER /home/$USER/zsh-syntax-highlighting
chown $USER /home/$USER/.zshrc
chown $USER /home/$USER/.oh-my-zsh

#加入高亮设置
sudo echo 'source /root/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> '/root/.zshrc'
sudo echo "source /home/$USER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "/home/$USER/.zshrc"


#把工具复制到bin里面
chmod +x ./tools/r2ray
chmod +x ./tools/scode
chmod +x ./tools/timeSync.sh
cp ./tools/r2ray /bin
cp ./tools/scode /bin
cp -rf ./tools $HOME
