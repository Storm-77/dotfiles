#! /usr/bin/bash
hpwks() {
    focused_before=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .id')
    echo "prev: $focused_before"

    stride=$(hyprctl -j monitors | jq -r 'length')
    monitor_ids=$(hyprctl -j monitors | jq -r '.[] | .id')

    for id in $monitor_ids
    do
        hyprctl dispatch focusmonitor $id
	calculated_workspace=$(($1 * stride - id))
        hyprctl dispatch workspace $calculated_workspace
    done

    #if [ $? -eq 0 ]; then
     # sleep 0.1
      hyprctl dispatch focusmonitor $focused_before
#    fi
}


