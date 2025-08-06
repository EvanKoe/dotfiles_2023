#!/bin/bash

# --- CONFIGURATION ---
# Define the size threshold (if a window is smaller than this, it will be resized)
MIN_WIDTH=20
MIN_HEIGHT=20

# Define the new size for the small windows
NEW_WIDTH=100
NEW_HEIGHT=100
# ---------------------

# Function to handle a new window event
handle() {
  # The event is "openwindow>>[windowAddress],[workspaceName],[windowClass],[windowTitle]"
  # We only need the window address, which is the first part after the '>>' and before the ','
  local window_address=$(echo "$1" | cut -d'>' -f2 | cut -d',' -f1)

  # Give Hyprland a moment to process the new window and its properties.
  # This helps prevent a race condition where the script queries the window's
  # properties before they are fully available.
  sleep 0.1

  # Get client info as JSON, find the specific client by its address, and process it
  hyprctl -j clients | jq -r --arg addr "0x$window_address" '.[] | select(.address == $addr)' | {
    # Read the JSON object for the new window into the `client_info` variable
    read -r client_info
		echo $client_info
    if [ -n "$client_info" ]; then
      # Extract properties using jq
      width=$(echo "$client_info" | jq '.size[0]')
      height=$(echo "$client_info" | jq '.size[1]')
      is_floating=$(echo "$client_info" | jq '.floating')

      # Only apply the rule to floating windows to avoid resizing tiled windows unexpectedly
      if [ "$is_floating" = "true" ]; then
        # Check if the window is smaller than our defined threshold
        if [ "$width" -lt "$MIN_WIDTH" ] && [ "$height" -lt "$MIN_HEIGHT" ]; then
          # If it is, dispatch a command to resize it to our desired size
          hyprctl dispatch resizewindowpixel "exact $NEW_WIDTH $NEW_HEIGHT,address:0x$window_address"
				else
				fi
      fi
    fi
  }
}

handle $1

# Use socat to listen to Hyprland's event socket
# The socket path is determined by the HYPRLAND_INSTANCE_SIGNATURE environment variable
# socat -U - "UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
#   # We only care about the 'openwindow' event
#   if [[ $line == openwindow* ]]; then
#     # Call our handle function in the background to avoid blocking the event loop
#     handle "$line" &
#   fi
# done

