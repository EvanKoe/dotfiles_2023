function get_percentage { 
  PERCENTAGE=`pactl get-sink-volume @DEFAULT_SINK@ | grep -oE '/[^/]*/' | head -n 1 | sed 's/\///g' | sed 's/ //g'`
  NEW_PERCENT=${PERCENTAGE::-1}

  if [ $NEW_PERCENT -gt 100 ]; then
    echo 100
    exit
  fi
  echo "$NEW_PERCENT"
  exit
}

function get_mute {
  MUTE=`pactl get-sink-mute @DEFAULT_SINK@`
  IS_MUTE=`echo $MUTE | sed 's/Mute: //g'`
  
  if [ "$IS_MUTE" = "yes" ]; then
    echo "true"
    exit
  fi

  echo "false"
  exit
}

if [ -z "$1" ]; then
  echo "Missing argument. See usage"
  exit
fi

case "$1" in
  "-h")
    echo -e "USAGE: ./sound.sh ARG\n-h: get help\n-m: get if muted (true or false)\n-p: get percentage of sound"
    exit ;;
  "-m")
    get_mute
    exit ;;
  "-p")
    get_percentage
    exit ;;
esac
