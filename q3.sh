#!/bin/bash
if [[ $# -ne 2 ]]; then
	echo 'Wrong number of arguments. Enter two numbers N and x'
	exit 1
fi

while [[ 1 -lt 2 ]]; do #repeat forever
 	top -b -o %MEM  -n'1'|  grep '^ *[0-9]' | head -n "$1" | awk -F' ' '{print $12, $10;}' 
 	sleep "$2"
 	echo
 	echo 'Getting new data'
 done 