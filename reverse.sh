#!/bin/bash

files=$(ls $1)

main() {
    arr=()
    for file in ${files[@]} ; do
        arr+=($file)
    done
    reverse ${arr[@]}
}

reverse() {
    local files=($@)
    for (( i=${#files[@]} ; i>0 ; i-- )) ; do
        echo "${files[i]}"
    done
}

main