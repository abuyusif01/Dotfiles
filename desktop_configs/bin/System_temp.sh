#!/bin/bash

# Am using this cuz i dont want to download any application and my system has less ram and resources so i have to find the way to minimize my usage..
# A script to show the thermal stage of your system
# Incase you dont want the remaining shit after the temp
# paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/' | awk '{ print$2 }'
# You can even tail the value to get only x_64 temp i think thats the only needed cuz am using this in my tmux

paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/' | awk '{ print$2 }' | tail -n 1
