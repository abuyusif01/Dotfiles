#!/bin/sh

server=$(ps -e | grep -i xorg)
if [ -z "$server" ]; then
    startx
else
    echo "X is running at `ps -e |grep -i xorg|awk '{print$2}'`"
fi

