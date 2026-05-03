#!/bin/bash

# Terminate existing bars
killall -q waybar

# Wait until Hyprland is actually reporting monitors
# This is more reliable than checking for the IPC socket variable
while [ -z "$(hyprctl monitors -j | jq -r '.[] | .name')" ]; do
  sleep 0.5
done

# Extra cushion for the compositor to finish internal setup
# sleep 1

# Launch your bars
waybar -c ~/.config/waybar/bar-one.jsonc &
waybar -c ~/.config/waybar/bar-two.jsonc &
