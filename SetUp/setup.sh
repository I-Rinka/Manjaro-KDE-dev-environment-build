#开始前要执行
#sudo passwd root
#创建root用户
#换源
pacman-mirrors -i -c China -m rank
pacman -Syy && pacman -S archlinuxcn-keyring
#huanyuan he ruan jian bao yao fenkai
echo '
[archlinuxcn]
 
SigLevel = Optional TrustedOnly
 
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
' >> "/etc/pacman.conf"



#安装软件
pacman -S fcitx fcitx-gtk3 fcitx-qt5 fcitx-configtool visual-studio-code-bin yaourt gdb typora google-chrome deepin.com.qq.im wine-wechat netease-cloud-music v2ray ttf-sarasa-gothic libinput-gestures xorg-xinput

#oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#安装vscode等开发工具
yaourt -S visual-studio-code-bin

#配置输入法（尚不知道是不是必须的）
#echo -e "export GTK_IM_MODULE=fcitx\n export QT_IM_MODULE=fcitx\n export XMODIFIERS=@im=fcitx" >> "~/.xprofile"

#手势中输入的config
#gesture swipe up 4	xdotool key super+0xff09
#gesture swipe up 3	xdotool key super+0xff09
#gesture swipe down 4	xdotool key super+0xff09
#gesture swipe down 3	xdotool key super+0xff09
#gesture swipe left 4    xdotool key super 0xffe3+super+0xff53
#gesture swipe left 3    xdotool key super 0xffe3+super+0xff53
#gesture swipe right 4	xdotool key super 0xffe3+super+0xff51
#gesture swipe right 3	xdotool key super 0xffe3+super+0xff51

#自行配置的话可能需要注意触控版的名字

#复制当前文件夹中的配置文件
cp ./config.json /etc/v2ray
cp ./libinput-gestures.conf /home/$USER/.config

#复制常用工具
cp -rf ./tools /home/$USER/

#改变权限
chmod 777 /home/$USER/.config/libinput-gestures.conf
chmod 777 -R /home/$USER/tools

#更换默认终端，在用户那里要再跑一顿
chsh -s /bin/zsh

#改变zshrc、oh-my-zsh和高亮的位置
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
cp -R ~/.oh-my-zsh  /home/$USER
cp -R ~/zsh-syntax-highlighting /home/$USER
cp ~/.zshrc /home/$USER

#改变用户的shell的所有者
chown $USER /home/$USER/zsh-syntax-highlighting
chown $USER /home/$USER/.zshrc
#chmod 777 -R /home/$USER/.oh-my-zsh
chown $USER /home/$USER/.oh-my-zsh

#加入高亮
echo 'source /root/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> '/root/.zshrc'
echo "source /home/$USER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "/home/$USER/.zshrc"

#加入root的vscode
echo "alias scode=\"code --user-data-dir=\"~/.vscode-root\"\"" >> '/root/.zshrc'
#echo "alias scode=\"code --user-data-dir=\"~/.vscode-root\"\"" >> "/home/$USER/.zshrc"

#其他需要手动的
#启用触控板手势前需要转换用户组
#sudo gpasswd -a $USER input
#zsh默认的主题需要自己改成agnoster
#生活工具
#设置wineQQ的分辨率
#env WINEPREFIX=/opt/deepinwine/apps/Deepin-QQ winecfg

