#!/bin/bash

PERCENT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "percent" | xargs)
VAR=${PERCENT#"percentage: "}
echo ${VAR::-1}
