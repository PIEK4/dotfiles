#!/bin/bash

DIR=~/Pictures/wallpaper
IMG=river-revine.jpg

awww img "$DIR"/"$IMG" \
  --transition-type wave \
  --transition-angle 60 \
  --transition-wave 45,30
