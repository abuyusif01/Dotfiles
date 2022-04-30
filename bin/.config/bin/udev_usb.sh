#!/bin/sh

export DISPLAY=:0
export XAUTHORITY=/home/blackdracula/.Xauthority
sleep 1s
cmd=`echo -e "NetworkManager\n" | dmenu -fn 'Fira Code'`
case $cmd in
    "ethernet"|"e")
        echo `date` >> /opt/azilink/logs/ethernet.logs
        #/home/blackdracula/.config/bin/wrapper.sh
        ;;
    "NetworkManager"|"n")
        echo `date` >> /opt/azilink/logs/NetworkManager.logs
        killall openvpn
        /usr/bin/systemctl restart NetworkManager
        ;;
esac
