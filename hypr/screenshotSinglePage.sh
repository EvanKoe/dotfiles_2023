#!/bin/bash

POSITION=$(hyprctl activewindow -j | jq .at | tr -d '[:space:]')
POSITION=${POSITION:1:-1}
Y=${POSITION#*,}
X=${POSITION%,*}

SIZE=$(hyprctl activewindow -j | jq .size | tr -d '[:space:]')
SIZE=${SIZE:1:-1}
WIDTH=${SIZE%,*}
HEIGTH=${SIZE#*,}

GEOMETRY="${X},${Y} ${WIDTH}x${HEIGTH}"

grim -g "${GEOMETRY}" - | wl-copy
