#!/bin/bash

case $1 in
  up)
    brightnessctl set 5%+
    ;;
  down)
    brightnessctl set 5%-
    ;;
  mute)
    pamixer -t
    ;;
esac

brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percentage=$((brightness * 100 / max_brightness))

notify-send -h string:x-dunst-stack-tag:brightness \
  -h int:value:"$percentage" \
  -i "display-brightness" \
  "Яркость: $percentage%"
