#!/bin/bash

var="$(tty)"
if [[ $var == */dev/tty1* ]]; then
    cat /home/naruto/.xinitrc | grep -v "#" | grep -v "xset" | grep -v "setxkbmap"
fi


if acpi | grep -oh "Discharging"
then
    echo You are running on battery
fi
