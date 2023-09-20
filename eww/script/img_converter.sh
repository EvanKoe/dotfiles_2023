#!/bin/bash
#
PATH="/home/ekoehler/Pictures/screenshots/eww_screen.jpg"
/bin/grim "$PATH"
/bin/convert "$PATH" -blur 0x30 "$PATH"
exit 0
