#!/usr/bin/env bash

function handle {
  if [[ ${1:0:12} == "activewindow" ]]; then
    if [[ ${1:14:12} == "virt-manager" ]]; then
        if [[ ${1:27} == *" on "* ]]; then
            hyprctl dispatch submap vm
        fi
    fi
  fi
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
