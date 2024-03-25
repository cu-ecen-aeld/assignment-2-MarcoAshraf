#!/bin/sh
filesdir=$1
searchstr=$2


if [ $# -lt 2 ]
then
   echo "Please enter a valid directory and a search string"
   exit 1
fi

if [ ! -d $filesdir ]
then
   echo "Please enter a valid directory"
   exit 1
fi

num_of_files=$(ls -1 $filesdir | wc -l)
num_of_matches=$(grep -r $searchstr $filesdir | wc -l)
echo "The number of files are $num_of_files and the number of matching lines are $num_of_matches"
