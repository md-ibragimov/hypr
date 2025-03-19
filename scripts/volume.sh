#!/bin/bash
case $1 in
  up)
    pamixer -i 5
    ;;
  down)
    pamixer -d 5
    ;;
  mute)
    pamixer -t
    ;;
esac

volume=$(pamixer --get-volume)
mute_status=$(pamixer --get-mute)
icon="audio-volume-high"

if [ "$mute_status" = "true" ]; then
  icon="audio-volume-muted"
elif [ "$volume" -lt 30 ]; then
  icon="audio-volume-low"
elif [ "$volume" -lt 70 ]; then
  icon="audio-volume-medium"
fi

notify-send -h string:x-dunst-stack-tag:volume \
  -h int:value:"$volume" \
  -i "$icon" \
  "Громкость: $volume%"
