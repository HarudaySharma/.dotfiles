#!/bin/bash

# Get battery information
while true; do

    battery_info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -E "state|to\ full|percentage")

# Extract state and percentage values
state=$(echo "$battery_info" | grep "state" | awk '{print $2}')
percentage=$(echo "$battery_info" | grep "percentage" | awk '{print $2}' | tr -d '%')

# Check if charging and percentage exceeds 80%
if [ "$state" == "charging" ] && [ "$percentage" -gt 80 ]; then
    # Notify user
    export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $USER)/bus
    notify-send "Battery Alert" "Battery percentage is above 80% ($percentage%) while charging."
fi
if [ "$state" == "discharging" ] && [ "$percentage" -lt 40 ]; then
    # Notify user
    export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $USER)/bus
    notify-send "Battery Alert" "Battery percentage is below 40% ($percentage%) while discharging."
fi
sleep 300
done
