charging=$(cat /sys/class/power_supply/AC/online)
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed 's/percentage://' | sed 's/ //g')

if [ $charging -eq 1 ]; then
  echo "🔌"$percentage
else
  echo " "$percentage
fi
