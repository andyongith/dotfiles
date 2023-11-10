
if hyprctl clients | grep -q rofi;
then
  if hyprctl clients | grep rofi | grep -q 
  then
    hyprctl dispatch closewindow title:rofi
    exit 0
  else
    hyprctl dispatch closewindow title:rofi
  fi
fi

dir="$HOME/.config/rofi/launcher"
theme='style'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
