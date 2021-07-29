#!/bin/bash

user=$(whoami)

if [[ $user != "root" ]]; then
    echo -n "Only root can run this. sorry :("
    exit;
fi

#Geting some stuff from internet
wget "https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb"
wget "https://raw.githubusercontent.com/blackdracula18/Dotfiles/master/tmux/.tmux.conf"
git clone https://github.com/maurosoria/dirsearch /opt/dirsearch

dpkg -i lsd_0.20.1_amd64.deb
sed -i "s/#Port 22/Port 443/g" /etc/ssh/sshd_config
sed -i "s/#ClientAliveInterval 1200/ClientAliveInterval 10000000/g" /etc/ssh/sshd_config
systemctl stop sshd
systemctl start sshd
