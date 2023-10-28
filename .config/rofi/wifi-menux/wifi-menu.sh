#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu"
theme='style'

rescan='Rescan wifi'
editconn="Edit Connections"
close='Close'

FIELDS=SSID,SECURITY,BARS
LIST=$(nmcli --fields "$FIELDS" device wifi list | sed '1d' | sed '/^--/d')

# Rofi CMD
rofi_cmd() {
	 rofi -dmenu -p "WiFi Menu" -theme ${dir}/${theme}.rasi
}

## # Confirmation CMD
## confirm_cmd() {
## 	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
## 		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
## 		-theme-str 'listview {columns: 2; lines: 1;}' \
## 		-theme-str 'element-text {horizontal-align: 0.5;}' \
## 		-theme-str 'textbox {horizontal-align: 0.5;}' \
## 		-dmenu \
## 		-p 'Confirmation' \
## 		-mesg 'Are you Sure?' \
## 		-theme ${dir}/${theme}.rasi
## }
## 
## # Ask for confirmation
## confirm_exit() {
## 	echo -e "$yes\n$no" | confirm_cmd
## }
## 
# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$rescan\n$editconn\n$LIST\n$close" | rofi_cmd
}
## 
## # Execute Command
## run_cmd() {
## 	selected="$(confirm_exit)"
## 	if [[ "$selected" == "$yes" ]]; then
## 		if [[ $1 == '--shutdown' ]]; then
## 			systemctl poweroff
## 		elif [[ $1 == '--reboot' ]]; then
## 			systemctl reboot
## 		elif [[ $1 == '--suspend' ]]; then
## 			mpc -q pause
## 			amixer set Master mute
## 			systemctl suspend
## 		elif [[ $1 == '--logout' ]]; then
##       hyprctl dispatch exit 1
## 		fi
## 	else
## 		exit 0
## 	fi
## }
## 
# Actions
chosen="$(run_rofi)"
case ${chosen} in
  $rescan)
    nmcli device wifi rescan
    ;;
  $editconn)
    nm-connection-editor
    ;;
esac

## echo -e $LIST
## echo -e $LIST | rofi_cmd
