#!/bin/sh

export maim="$HOME/Pictures/screenshots/$(date +%m-%d-%y-%H-%M-screenshot%S).png"
maim "$maim" && xclip -selection clipboard -t image/png "$maim"

