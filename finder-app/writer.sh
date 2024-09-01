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


# num_of_files_searched=0
# num_of_matches=0

# search_dir_recursively() {
# 	for i in "$1"/*;do
# 		if [ -d "$i" ]; then
# 			search_dir_recursively "$i" $2
# 		elif [ -f "$i" ]; then
# 			num_of_files_searched=$((num_of_files_searched+1))
# 			temp=$(grep -o "$2" "$i" | wc -l)
# 			number_of_matches=$((number_of_matches+temp)) 
# 		fi
# 	done
# }


# search_dir_recursively $1 $2
# echo "The number of files are $num_of_files_searched and the number of matching lines are $number_of_matches"

