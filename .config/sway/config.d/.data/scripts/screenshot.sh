#!/bin/bash
readonly SCREENSHOTDIR="$HOME/.cache/screenshot"

if [[ ! -e "$SCREENSHOTDIR" ]]; then
    mkdir -p "$SCREENSHOTDIR"
fi
readonly TIME="$(date +%Y-%m-%d-%H-%M-%S)"
readonly IMGPATH="$SCREENSHOTDIR/screenshot-$TIME.png"
grim -g "$(slurp)" "$IMGPATH"
if [[ -e $IMGPATH ]]; then
    wl-copy < $IMGPATH
    notify-send "Screenshot saved and copied to clipboard" "$IMGPATH"
else 
    notify-send "Selection cancelled" "No screenshot saved"
fi
