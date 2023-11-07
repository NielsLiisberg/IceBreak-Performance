#!/bin/bash
# cd ~/prj/icebreak-performance/sleep;bash sleeprun.sh
requests=1000
while test $requests -gt 0;do
    curl --max-time 5 "http://MY_IBM_I:60080/.1/sleep.rpgle?timer=1" 
    let requests=$requests-1
done
