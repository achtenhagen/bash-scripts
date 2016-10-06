#!/bin/bash

# Construct a text table with five columns:
# user, views, time (duration), id, title

wget -O index.html youtube.com
users=($(grep -o '<a href="/user/.*" class="g' index.html | cut -d '"' -f2 | cut -d "/" -f3))
views=($(grep -o '<li>.* views</li>' index.html | sed 's/<.*>\(.*\)<\/.*>/\1/' | sed "s/ views//g" | sed "s/,//g"))
times=($(grep -o '<span class="video-time" aria-hidden="true">.*</span>' index.html | sed 's/<.*>\(.*\)<\/.*>/\1/'))
ids=($(grep -o '<a href="/watch\?v=.*</a>' index.html -E | cut -d '"' -f2 | cut -d '=' -f2))
grep -o '<h3 class="yt-lockup-title ">.*</h3>' index.html | grep '<a.*</a>' -o | sed 's/<.*>\(.*\)<\/.*>/\1/' > titles.txt

# Read video titles
IFS=$'\n'
read -d '' -r -a lines < titles.txt

# Print each row
for i in ${!users[@]}; do
    printf "^%s^%s^%s^%s^%s\n" ${users[$i]} ${views[$i]} ${times[$i]} ${ids[$i]} ${lines[$i]}
done | column -ts '^'