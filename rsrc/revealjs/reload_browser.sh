#!/usr/bin/env bash
# Find browser window specified by argument $1 or read from YAML value "title:"
# and reload.
# NOTE: reloading window in background without focus/activation didn't work, so
# focus is momentarily shifted, then back

browser=${BROWSER:-firefox}
reload_keys="CTRL+R"
if [[ -n "$1" ]]; then
    window_title="$1"
elif [[ -f "$1" ]]; then
    window_title=$(grep 'title:' "$1" | awk -F':' '{print $2}')
fi
[[ -z "$window_title" ]] && echo "ERROR in $0: window title unspecified" && exit 1

window_orig=$(xdotool getactivewindow)

xdotool search --name "$window_title" windowactivate --sync key --clearmodifiers "$reload_keys"

xdotool windowfocus --sync "$window_orig"
xdotool windowactivate --sync "$window_orig"
