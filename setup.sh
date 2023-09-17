#!/bin/sh

# creating some directories in case if they don't exist already
mkdir -p $HOME/.config/hypr/ $HOME/.config/kitty/ $HOME/.config/waybar

# for home directory
ln -si $PWD/.bashrc $PWD/.gitconfig $PWD/.vimrc $HOME/

# hyprland
ln -si $PWD/hypr/hyprland.conf $HOME/.config/hypr/

# kitty
ln -si $PWD/kitty/kitty.conf $HOME/.config/kitty/

# waybar
ln -si $PWD/waybar/config.jsonc $PWD/waybar/modules.jsonc $PWD/waybar/style.css $HOME/.config/waybar
