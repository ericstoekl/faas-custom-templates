#!/bin/sh


export nano=`date +%s%N`
# -s 600x400
cat - > ./$nano.mp4
ffmpeg -loglevel panic -i $nano.mp4 -vf scale=iw*.5:ih*.5 -pix_fmt rgb24 -r 20 -f gif - | gifsicle --optimize=3 > /dev/stdout \
  && rm $nano.mp4

