#!/bin/sh

export maim="$HOME/Pictures/screenshots/$(date +%m-%d-%y-%H-%M-screenshot%S).png"
maim -su "$maim" && xclip -selection clipboard -t image/png "$maim"

