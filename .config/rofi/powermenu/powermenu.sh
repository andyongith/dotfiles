#!/usr/bin/env bash

scriptpath=$(dirname "$(readlink -f $0)")

options="Shutdown|Reboot|Logout|Suspend"
ask_option() {
  echo -e "${options}|Cancel" | \
    rofi -dmenu -sep "|" \
    -p "Power Menu" \
    -mesg "Uptime: `uptime -p | sed -e 's/up //g'`" \
    -theme ${scriptpath}/style.rasi
}

ask_confirm() {
  echo -e "Yes|No" | \
    rofi -dmenu -sep "|" -mesg "Are you Sure to ${selected}" \
    -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
    -theme ${scriptpath}/style.rasi
}


selected=$(ask_option)
if echo $options | grep -q $selected && [ ${#selected} -gt 0 ]
then
  if ! [ $(ask_confirm) == "Yes" ]
  then
    echo $selected cancelled
    exit 1
  fi

  case $selected in
    "Shutdown")
      echo "Shuting down the computer"
      systemctl poweroff
      ;;
    "Reboot")
      echo "Rebooting the computer"
      systemctl reboot
      ;;
    "Suspend")
      echo "Suspending the computer"
      mpc -q pause
      amixer set Master mute
      systemctl suspend
      ;;
    "Logout")
      echo "Logging out"
      hyprctl dispatch exit 1
      ;;
  esac
else
  echo Cancelled
fi
