#!/usr/bin/env bash

MONITORS=$(hyprctl monitors -j)

# Keep everything on the laptop by default
hyprctl dispatch moveworkspacetomonitor 1 eDP-1
hyprctl dispatch moveworkspacetomonitor 2 eDP-1
hyprctl dispatch moveworkspacetomonitor 3 eDP-1

# Move workspaces if the external monitors are active
if echo "$MONITORS" | jq -e '.[] | select(.name=="DP-9" and .disabled==false)' >/dev/null; then
  hyprctl dispatch moveworkspacetomonitor 2 DP-9
fi

if echo "$MONITORS" | jq -e '.[] | select(.name=="DP-10" and .disabled==false)' >/dev/null; then
  hyprctl dispatch moveworkspacetomonitor 3 DP-10
fi
