#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "Enter just one argument: the folder name"
	exit 1
fi
if [[ -d  $1 ]]; then
	ls -lS "$1" | head -n 2 | tail -n 1 | awk '{print $9;}'
else
	echo "Not a valid directory"
fi

