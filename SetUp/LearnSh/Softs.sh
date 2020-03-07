sudo pacman -S fcitx fcitx-gtk3 fcitx-qt5 fcitx-configtool visual-studio-code-bin yaourt gdb typora google-chrome deepin.com.qq.im wine-wechat netease-cloud-music v2ray ttf-sarasa-gothic libinput-gestures xorg-xinput 
#fcitx-sogoupinyin

#oh-my-zsh
sudo git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
sudo git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

#安装vscode等开发工具
yaourt -S visual-studio-code-bin

#配置输入法（尚不知道是不是必须的）
#echo -e "export GTK_IM_MODULE=fcitx\n export QT_IM_MODULE=fcitx\n export XMODIFIERS=@im=fcitx" >> "~/.xprofile"
