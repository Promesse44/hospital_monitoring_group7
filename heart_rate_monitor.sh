#!/usr/bin/env bash

read -p "Enter device name: " device_name


while true
do
        timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        heart_rate=$((RANDOM % 41+60))
        echo "$timestamp $device_name $heart_rate" >> heart_rate_log.txt
        sleep 1
done &
echo "The PID is: $!"
