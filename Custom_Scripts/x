#!/bin/bash
X_servr=$(ps -e | grep X | awk '{print$1}')
if [ -z $X_servr ]; then 
    startx;exit
else
    echo "X is running"
fi
