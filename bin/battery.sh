upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | sed 's/percentage://' | sed 's/ //g'
