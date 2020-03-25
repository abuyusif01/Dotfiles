#!/bin/bash

# Show the system battery percentage
# blackdracula18

CHARGE=Charging
battery=`cat /sys/class/power_supply/BAT0/capacity`
battery_charging=`cat /sys/class/power_supply/BAT0/status`

if [ $battery -eq 100 ]; then
    echo "fully-charged 100%"
fi

if [ $battery_charging == Discharging ]; then
    echo "$battery% remaining"
fi

if [ $battery_charging == $CHARGE ]; then
    echo "$battery% $battery_charging"
fi
