#!/bin/bash
## test parameters:
## run this:
## cd /Users/nli/prj/icebreak-performance/pingiws;zsh stpingrun2.sh
let connections=50
let repeat=2000
let sleep=100000

echo "Start test"
let connection=1
while test $connection -le $connections ; do
    ##./pingrun.sh $connections &
    node pingnode2.mjs $connection $repeat  $sleep &
    let connection=$connection+1
done
