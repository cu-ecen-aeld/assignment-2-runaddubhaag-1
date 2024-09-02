#!/bin/sh

# check for correct number of parameters
if [ "$#" -ne 2 ]; then
	echo "Illegal number of parameters"
	echo "Usage: $0 <writefile> <writestr>"
	exit 1
fi

# check that the first arg is a valid file path
if ! [ -e "$1" ]; then
	echo "$1 does not exist, creating file..."
	fname="$1"  
	dname=$(dirname $fname)               # output: .
	if ! [ -d $dname ]; then
		mkdir -p "$dname"
	fi
fi 

echo $2 > $1

