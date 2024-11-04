#!/bin/bash
# Read the CPU temperature in millidegrees Celsius
temp=$(cat /sys/class/hwmon/hwmon5/temp1_input)  # Replace with correct hwmon path

# Convert to degrees Celsius with 1 decimal place precision
temp_celsius=$(echo "scale=1; $temp / 1000" | bc)

# Outpuet the temperature
echo " $temp_celsius°C "
