#!/bin/bash

swayidle -w timeout 150 'swaylock -f' timeout 400 'hyprctl dispatch dpms  off' resume 'hyprctl dispatch dpms on'
