#!/bin/bash
STATUS=$(cat /sys/class/power_supply/BAT1/status)
LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)

if [[ "$LEVEL" -lt "10" ]]; then
	if [[ "$STATUS" == "Discharging" ]]; then
		notify-send --urgency=critical --expire-time=4000 --icon=battery-caution "Bateria Descarregando" "Está com ${LEVEL}%"
	fi
fi

if [[ "$LEVEL" -lt "3" ]]; then
	if [[ "$STATUS" == "Discharging" ]]; then
		notify-send --urgency=critical --expire-time=4000 --icon=battery-caution "Desligando ..."
                echo "DESLIGADO VIA SCRIPT" >> ${HOME}/DESLIGADO_VIA_SCRIPT.txt
                sudo poweroff
	fi
fi
