#!/bin/sh
PNG_DIR=/tmp/pngs
mkdir $PNG_DIR
FPS=20
WIDTH=200
START=10
LENGTH=10
# ffmpeg -i $1 -an -r 5 $PNG_DIR/%04d.png
# convert $PNG_DIR/*.png $2  
ffmpeg -ss $START -i $1 -t $LENGTH -filter_complex "[0:v] fps=$FPS, scale=$WIDTH:-1, split [a][b];[a] palettegen [p];[b][p] paletteuse" $2 
rm -rf $PNG_DIR 