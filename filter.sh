#!/bin/bash

path=$1
files=$(ls $path)

average() {
    local sum=0
    local files=($@)
    for file in ${files[@]} ; do
        if [ -f "$path/$file" ] ; then        
            filesize=$(wc -c < "$path/$file")
            sum=$(expr $sum + $filesize)
        fi
    done
    average=$(expr $sum / ${#files[@]})    
}

filter() {
    local files=($@)
    for file in ${files[@]} ; do
        if [ -f "$path/$file" ] ; then        
            filesize=$(wc -c < "$path/$file")
            if [ $filesize -ge $average ] ; then
                echo $file
            fi
        fi
    done
}

main() {    
    average ${files[@]}
    filter ${files[@]}
}

main