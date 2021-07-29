#!/bin/bash

user=$(whoami)
get_all_packages()
{
    wget "https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb"
    wget
    "https://raw.githubusercontent.com/blackdracula18/Dotfiles/master/tmux/.tmux.conf"
    ~/.tmux.conf
}


if [[ $user != "root" ]]; then
    echo -n "Only root can run this. sorry :("
    exit;
fi

dpkg -i lsd_0.20.1_amd64.deb
sed -i "s/#Port 22/Port 443/g" /etc/ssh/sshd_config
systemctl stop sshd
systemctl start sshd
