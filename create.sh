#!/bin/bash

depth=$1
breadth=$2
dir=$3
mode=$4
node=0

cd $dir

# --- Depth-first Traversal --- #

depth_traverse() {
    declare -i level=$1    
    declare -i i=0
    if (( $level < $depth )); then
        mkdir "tree-$node"
        echo "tree-$node"
        cd "tree-$node"
        let node++
        let level++
        while [ $i -lt $breadth ]; do
            depth_traverse $level $i            
            let i++
        done
        cd ..
    fi
}

# --- Main Program --- #

if [ $mode = "depth" ]; then
    depth_traverse 0 0
fi
