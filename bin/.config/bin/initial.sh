#!/bin/bash

# glob vars
user=$(whoami)
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'

if [[ $user != "root" ]]; then
    echo -n "Only root can run this. sorry :("
    exit;
fi

# Geting some stuff from internet
function download_files()
{
	echo -en "==> ${green}[+]${nc} Downloading remote files"; echo -en "."
	wget -q "https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb" -O /tmp/lsd.deb; echo -en ".";
	wget -q "https://raw.githubusercontent.com/blackdracula18/Dotfiles/master/tmux/.tmux.conf" -O $HOME/.tmux.conf; echo -en ".";
	git clone --quite http://github.com/blackdracula18/dotfiles $HOME/.dotfiles; echo -en ".";
	apt install stow > /dev/null 2>&1; echo -en ".";
	wget -q "https://github.com/sharkdp/bat/releases/download/v0.18.2/bat-musl_0.18.2_amd64.deb" -O /tmp/bat.deb; echo ".";
	echo -en "==> ${green}[+]${nc} Installing fzf"; echo -ne "."
	apt install fzf > /dev/null 2>&1; echo ".";
}

function configure_zsh()
{
	echo -en "==> ${green}[+]${nc} Configuring ZSH"; echo -en ".";
	cd $HOME/.dotfiles; stow zsh; source $HOME/.zshrc; echo -en ".";
	echo -en "==> ${green}[+]${nc} Changing default shell to /bin/zsh"; echo -ne ".";
	chsh /bin/zsh; echo ".";
}

function configure_sshd()
{

	echo -en "==> ${green}[+]${nc} Stopping sshd"; for i in 1 2; do echo -en "."; sleep 0.3s; done;
	systemctl stop sshd > /dev/null 2>&1; echo ".";
	echo -en "==> ${green}[+]${nc} editing sshd files"; echo -ne ".";
	echo "Port 443" >> /etc/ssh/sshd_config; echo -ne ".";
	echo "ClientAliveInterval 720" >> /etc/ssh/sshd_config; echo -ne ".";
	echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config; echo  ".";
	echo -en "==> ${green}[+]${nc} Startting sshd"; echo -ne "."; sleep 0.3s; echo -ne ".";
	systemclt start sshd; echo ".";
}

function change_root_passwd()
{
	echo -en "==> ${green}[+]${nc} Changing root passwd"; for i in 1 2; do echo -en "."; sleep 0.3s; done; echo ""
	echo -e "1111/n1111" | passwd; echo ".";
}

function install_local_files()
{
	echo -en "==> ${green}[+]${nc} Installing Local files"; for i in 1 2; do echo -en "."; sleep 0.3s; done; echo ""
	dpkg -i /tmp/lsd.deb > /dev/null 2>&1; echo -ne ".";
	dpkg -i /tmp/bat.deb > /dev/null 2>&1; echo -ne ".";
	echo "";
}

function clean_up()
{

	echo -en "==> ${green}[+]${nc} Cleaning Local filesystem"; for i in 1 2; do echo -en "."; sleep 0.3s; done; echo ""
	rm /tmp/lsd.deb; echo -ne ".";
	rm /tmp/bat.deb; echo -ne ".";
	echo -en "==> ${green}[+]${nc} Exiting"; for i in 1 2 3 4; do echo -en "."; sleep 0.3s; done; echo ""
}

download_files
configure_zsh
configure_sshd
change_root_passwd
install_local_files
clean_up
