#!/bin/sh

handle() {
  case $1 in
    # workspace*) sleep 0.4 && $HOME/.config/hypr/colorBar.sh;;
    openwindow*) sleep 0.4 && $HOME/.config/hypr/resize_small_wins.sh $0;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
