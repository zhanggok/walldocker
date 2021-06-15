#!/bin/bash
while read e
do
    v=${e##*/}
    r=${v%:*}
    if [ ! -d "$r" ]; then
        mkdir $r
        echo "from $e" > $r/Dockerfile
    else
       echo $e
    fi
 #   mkdir $r 
 #   echo "from $e" > $r/Dockerfile
done < file.txt
