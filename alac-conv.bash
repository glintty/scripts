#!/bin/bash
root=$PWD

echo "GNU GPLv3"

for artist in *
do
  cd "$artist" &>/dev/null || continue # skip iteration if file
  echo "==>Converting artist '${artist}'..."
  for album in *
  do
    cd "$album" &>/dev/null || continue # skip iteration if file
    echo "^===>Converting album '${album}'..."
    for i in *.flac; do ffmpeg -loglevel panic -y -i "$i" -c:v copy -acodec alac -map_metadata 0 -id3v2_version 3 "${i%.*}.m4a"; done
    cd ..
  done
  cd $root
done
