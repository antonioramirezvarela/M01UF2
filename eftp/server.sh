#!/bin/bash

CLIENT="172.31.98.160"

echo "servidor EFTP"

echo "(0) Listen"

DATA=`nc -l -p 3333 -w 0`

echo $DATA

echo "(3) Test & Send"

if [ "$DATA" != "EFTP 1.0" ]
then	
	echo "ERROR 1: BAD HEADER"
	sleep 1
	echo "KO_HEADER" | nc $CLIENT 3333
	exit 1
fi

echo "OK_HEADER"
sleep 1
echo "OK_HEADER" | nc $CLIENT 3333

echo "(4) Listen"

DATA=`nc -l -p 3333 -w 0`

echo $DATA

echo "(7) Test & Send"

if [ "$DATA" != "BOOOM" ]
then 
	echo "ERROR 2: BAD HANDSHAKE2"

	sleep 1 
	echo "KO_HANDSHAKE" | ns $CLIENT 3333
	exit 2
fi

sleep 1 
echo "OK_HANDSHAKE" | nc $CLIENT 3333

echo "(8) Listen"

DATA=`nc -l -p 3333 -w 0`


