#!/bin/bash

## Collect data
cache_dir="$HOME/.cache/eww/time"
cache_is_420=${cache_dir}/time-icon

## Make cache dir
if [[ ! -d "$cache_dir" ]]; then
	mkdir -p ${cache_dir}
fi

is_420() {
    time=`date +%I:%M`

    if [ "$time" == "04:20" ]; then
        is_420="It's"
    else
        is_420="Not"
    fi
    echo "$is_420" >  ${cache_is_420}
}

if [[ "$1" == "--icon" ]]; then
    is_420
    cat ${cache_is_420}
fi
