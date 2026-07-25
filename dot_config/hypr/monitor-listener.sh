#!/usr/bin/env bash

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET" | while read -r event; do
  case "$event" in
  monitoradded* | monitorremoved* | monitorenabled* | monitordisabled*)
    ~/.config/hypr/assign-workspaces.sh
    ;;
  esac
done
