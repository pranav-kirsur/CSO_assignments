#!/bin/bash
if [[ $# -ne 2 ]]; then
	echo "Enter just two arguments: the folder name and the date"
	exit 1
fi
date -d "$2"
if [[ $? -ne 0 ]]; then
	echo "Invalid date"
	exit 1
fi

givendate=$(date -d "$2" +"%s") #converting date in unix time


if [[ -d  "$1" ]]; then
	ls "$1"| while read line
		do
			filedate=$(stat "$1/$line" | grep -e '^Change:' | cut -d' ' -f'2-')
			fileunixtime=$(date -d "$filedate" +"%s")
			if [[ fileunixtime -lt givendate ]]; then
				mv "$1/$line" archive-date 
			fi
		done
else
	echo "Not a valid directory"
fi
