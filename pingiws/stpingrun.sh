#!/bin/bash
## test parameters:
let connections=100
let repeat=100
let sleep=0

echo "Start test"
let connection=1
while test $connection -le $connections ; do
    ##./pingrun.sh $connections &
    node pingnode.mjs $connection $repeat  $sleep &
    let connection=$connection+1
done
