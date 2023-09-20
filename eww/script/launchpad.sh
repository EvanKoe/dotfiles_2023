#!/bin/bash

# eww close dock &
eww close shutdown_menu &
$HOME/.config/eww/script/img_converter.sh
eww open --toggle launchpad
