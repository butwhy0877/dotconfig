#!/bin/bash
## dunstBright
#
msgId="3378455"
history_ignore=yes

light "$@" > /dev/null

brightpercent="$(light -G)"

dunstify -a "changeBrightness" -u low -r "$msgId" \
	-h int:value:"$brightpercent" "☀︎ Brightness: ${brightpercent}%"
