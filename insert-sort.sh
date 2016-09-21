#!/bin/bash

sort() {
    for ((i=1;i<count;i++)) ; do
       tmp=${numbers[i]}
       j=$((i-1))
       while [ $tmp -lt ${numbers[j]} ]
       do
          numbers[j+1]=${numbers[j]}
          let j--
          if [ $j == -1 ] ; then
             break
          fi
       done
       numbers[j+1]=$tmp
    done
}

for arg in "$@" ; do
    numbers+=($arg)
done
count=${#numbers[@]}
sort
echo ${numbers[@]}