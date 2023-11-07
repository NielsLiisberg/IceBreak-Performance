#!/bin/bash
## test parameters:
## run this:
## cd /www/icebreak-performance/ping2;bash stpingrun2.sh
## or from ILE:
## SBMJOB CMD(CALL PGM(QP2SHELL) PARM(('/QOpenSys/pkgs/bin/bash') ('-c') ('export PATH=/QOpenSys/pkgs/bin:$PATH;cd /www/icebreak-performance/ping2;stpingrun2.sh'))) JOB(PERFTEST)                                         
let connections=500
let repeat=1000
let sleep=10

echo "Start test"
let connection=1
while test $connection -le $connections ; do
    node pingnode2.mjs $connection $repeat  $sleep &
    let connection=$connection+1
done


