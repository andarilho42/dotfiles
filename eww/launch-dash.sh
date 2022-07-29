#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.dashboard"
CFG="$HOME/.config/eww/"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} --config "$CFG" open-many \
		   music \
		   app \
		   weather \
		   calendar \
		   clock
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} --config "$CFG" close-all
	rm "$FILE"
fi