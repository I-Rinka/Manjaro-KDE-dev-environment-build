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
sudo cp -R ~/.oh-my-zsh  /home/$USER
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m#####oh-my-zsh配置已完成#####\033[0m"
else
    echo -e "\033[41;37m#####oh-my-zsh配置出现错误#####\033[0m"
    exit
fi
sudo cp -R ~/zsh-syntax-highlighting /home/$USER
if [ $? -eq 0 ]
then
    echo -e "\033[42;30m#####zsh高亮配置已完成#####\033[0m"
else
    echo -e "\033[41;37m#####zsh高亮配置出现错误#####\033[0m"
    exit
fi
sudo cp ./configs/.zshrc /home/$USER
sudo cp ./configs/.zshrc /root

#改变用户的shell的所有者
#chmod 777 -R /home/$USER/.oh-my-zsh
sudo chown $USER /home/$USER/zsh-syntax-highlighting
sudo chown $USER /home/$USER/.zshrc
sudo chown $USER /home/$USER/.oh-my-zsh

#加入高亮设置
sudo echo 'source /root/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> '/root/.zshrc'
sudo echo "source /home/$USER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "/home/$USER/.zshrc"


#把工具复制到bin里面
sudo chmod +x ./tools/r2ray
sudo chmod +x ./tools/scode
sudo chmod +x ./tools/timeSync.sh
sudo cp ./tools/r2ray /bin
sudo cp ./tools/scode /bin
cp -rf ./tools $HOME

#生活工具
#设置wineQQ的分辨率
#env WINEPREFIX=/opt/deepinwine/apps/Deepin-QQ winecfg

#淦，才发现$HOME表示的就是当前用户的家目录