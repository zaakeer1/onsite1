#!/bin/bash

var=$(head -n 1 ~/onsite1/file1)
sed '1d' file1 | sort -k 2 > ~/onsite1/sorted_file1
awk -v x="$var" 'NR==1{print x} 1' ~/onsite1/sorted_file1 > ~/onsite1/f1

var=$(head -n 1 ~/onsite1/file2)
sed '1d' file2 | sort -k 2 > ~/onsite1/sorted_file2
awk -v x="$var" 'NR==1{print x} 1' ~/onsite1/sorted_file2> ~/onsite1/f2

var=$(head -n 1 ~/onsite1/file3)
sed '1d' file3 | sort -k 1 > ~/onsite1/sorted_file3
awk -v x="$var" 'NR==1{print x} 1' ~/onsite1/sorted_file3> ~/onsite1/f3

join -1 2 -2 1 ~/onsite1/f1 ~/onsite1/f3 > ~/onsite1/temp_file1

var=$(head -n 1 ~/onsite1/temp_file1)
sed '1d' temp_file1 | sort -k 4 > ~/onsite1/sorted_temp_file1
awk -v x="$var" 'NR==1{print x} 1' ~/onsite1/sorted_temp_file1> ~/onsite1/ffile

join  -1 4 -2 2 ~/onsite1/ffile ~/onsite1/f2 > ~/onsite1/temp_file1
sed '/^$/d' temp_file1 > output
cat output

echo Enter string to search
read search_var

egrep $search_var output


