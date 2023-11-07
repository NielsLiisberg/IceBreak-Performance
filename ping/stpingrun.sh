#!/bin/bash
## test parameters:
let sessions=1
let repeat=100
let sleep=1

echo "Start test"
let counter=1
while test $counter -le $sessions ; do
    ##./pingrun.sh $sessions &
    node pingnode.js $counter $repeat $sleep &
    let counter=$counter+1
done
