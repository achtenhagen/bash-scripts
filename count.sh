#!/bin/bash

files=$(ls /bin/)
declare -a letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

for l in ${letters[@]} ; do
    counter=0
	for i in $files ; do     
        if [ ${i:0:1} = $l ]; then            
            counter=$((counter+1))
        fi
    done
    echo $l $counter
done