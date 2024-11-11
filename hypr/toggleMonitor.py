#!/bin/python3
import os, subprocess, json

MONITOR = "eDP-1"
MONITOR_SETTINGS = "highres,0x0,1"

# Get monitor list
monitor_list = subprocess.getoutput("hyprctl monitors all -j")
json_monitors = json.loads(monitor_list)
is_monitor_disabled = False

# Get if the monitor is disabled
for monitor in json_monitors:
    if monitor['name'] != MONITOR:
        continue

    if monitor['disabled'] is True:
        print(f"Monitor {MONITOR} is disabled")
        is_monitor_disabled = True
        break
    else:
        print(f"Monitor {MONITOR} is enabled")


# Disable/enable the monitor
if is_monitor_disabled is True:
    print(f"Disabling monitor {MONITOR}...")
    os.system(f"hyprctl keyword monitor {MONITOR},disable")
else:
    print(f"Enabling monitor {MONITOR}...")
    os.system(f"hyprctl keyword monitor {MONITOR},{MONITOR_SETTINGS}")

# Reload bar and notch
os.system("eww close bar")
os.system("eww close notch")
os.system("eww open-many bar notch")
os.system("hyprctl reload")
