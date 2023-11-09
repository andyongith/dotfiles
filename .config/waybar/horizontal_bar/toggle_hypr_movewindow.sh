#!/bin/bash

moveMouseBtn=274

if hyprctl binds | grep -B 2 -A 3 "mouse:${moveMouseBtn}" | grep -A 6 'modmask: 0' | grep -q 'arg: movewindow'
then
  if [[ $1 == '-o' ]]; then
    echo on
  else
    hyprctl keyword unbind , mouse:${moveMouseBtn}, movewindow
  fi
else
  if [[ $1 == '-o' ]]; then
    echo off
  else
    hyprctl keyword bindm , mouse:${moveMouseBtn}, movewindow
  fi
fi
