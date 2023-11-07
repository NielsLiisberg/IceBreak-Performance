#!/bin/bash
## test parameters:
let threads=10
let sessions=5
let repeat=10
let sleep=500

echo "Start test, shared pool and session object"
let threadno=1
while test $threadno -le $threads ; do
    node request.js $sessions $threadno $repeat $sleep &
    let threadno=$threadno+1
done
