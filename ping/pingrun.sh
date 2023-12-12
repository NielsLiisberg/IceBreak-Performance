#!/bin/bash
requests=100
let reqnum=(10000+$1)*100000
while test $requests -gt 0;do
    let nextnumber=$reqnum+1
    let responsenumber=$(curl -D "dmp-$reqnum.txt" -sS "http://MY_IBM_I:60800/.1/echoplusone?n=$reqnum&sleep=1") 
    if [[ $nextnumber != $responsenumber ]]; then
        echo "Error !!$nextnumber+1,$responsenumber "
        exit
    else
        echo $reqnum
        rm "dmp-$reqnum.txt"
    fi 
    ##sleep 0.001 
    let requests=$requests-1
    let reqnum=$reqnum+1
done
