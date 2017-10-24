#!/usr/bin/env bash

charging=0
percentage=''

if [ "$(expr $(uname -s))" == "Darwin" ]; then
  charging=$(pmset -g batt | grep 'AC Power' | wc -l | sed 's/ //g')
  percentstring=($(pmset -g batt | tail -1))
  percentage=$(echo ${percentstring[2]} | sed 's/;//')
else
  charging=$(cat /sys/class/power_supply/AC/online)
  percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed 's/percentage://' | sed 's/ //g')
fi

if [ $charging -eq 1 ]; then
  echo "🔌 "$percentage
else
  echo " "$percentage
fi
