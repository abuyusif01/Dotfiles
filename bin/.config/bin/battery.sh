#!/bin/bash

# Show the system battery percentage
# blackdracula18

CHARGE=charging
battery=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage" | tail -n 1 | awk '{ print $2 }' | sed 's/%//')
battery_charging=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage" | head -n 1 | awk '{ print $2 }')
if [ $battery -eq 100 ]; then
echo "fully-charged 100%"
fi
if [ $battery_charging == discharging ]; then
echo "$battery% remaining"
fi
if [ $battery_charging == $CHARGE ]; then
echo "$battery% $battery_charging"
fi
