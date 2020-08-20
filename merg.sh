#!/bin/bash
no=1
c=2
while [ $no -le 3 ]
do
    	if [ $no -eq 3 ]
	then
		c=1
	fi
	var=$(head -n 1 ~/onsite1/file$no)
	sed '1d' ~/onsite1/file$no | sort -k $c > ~/onsite1/sorted_file$no
	awk -v x="$var" 'NR==1{print x} 1' ~/onsite1/sorted_file$no > ~/onsite1/f$no
	
	(( no++ ))
done

join -1 2 -2 1 ~/onsite1/f1 ~/onsite1/f3 > ~/onsite1/temp_file1

var=$(head -n 1 ~/onsite1/temp_file1)
sed '1d' ~/onsite1/temp_file1 | sort -k 4 > ~/onsite1/sorted_temp_file1
awk -v x="$var" 'NR==1{print x} 1' ~/onsite1/sorted_temp_file1> ~/onsite1/ffile

join  -1 4 -2 2 ~/onsite1/ffile ~/onsite1/f2 > ~/onsite1/temp_file1
sed '/^$/d' ~/onsite1/temp_file1 > ~/onsite1/output
awk '{print $1" "$2" "$3" "$4" "$5}' ~/onsite1/output > ~/onsite1/ffile
cat ~/onsite1/ffile


while :
do
echo Enter string to search format = colmn:string
read mainstr
#Split the string based on the delimiter, ':'
readarray -d : -t strarr <<< "$mainstr"
# Print each value of the array by using loop
n=0
while [ $n -le '1' ]
do
if [ $n -eq '0' ]
then
c1="${strarr[n]}"
else
c2="${strarr[n]}"  

fi
(( n++ ))
done
line_no=0

if [ $c1 = "phoneno" ]
then

cut -d " " -f1 ~/onsite1/ffile > ~/onsite1/temp_file1	
noof_lines=$(egrep -i -c $c2 ~/onsite1/temp_file1)			
egrep -i -n $c2 ~/onsite1/temp_file1 > ~/no.txt

elif [ $c1 = "Email" ]
then


cut -d " " -f2 ~/onsite1/ffile > ~/onsite1/temp_file1	
noof_lines=$(egrep -i -c $c2 ~/onsite1/temp_file1)			
egrep -i -n $c2 ~/onsite1/temp_file1 > ~/no.txt

elif [ $c1 = "Name" ]
then


cut -d " " -f3 ~/onsite1/ffile > ~/onsite1/temp_file1	
noof_lines=$(egrep -i -c $c2 ~/onsite1/temp_file1)			
egrep -i -n $c2 ~/onsite1/temp_file1 > ~/no.txt

elif [ $c1 = "branch" ]
then


cut -d " " -f4 ~/onsite1/ffile > ~/onsite1/temp_file1	
noof_lines=$(egrep -i -c $c2 ~/onsite1/temp_file1)			
egrep -i -n $c2 ~/onsite1/temp_file1 > ~/no.txt

elif [ $c1 = "ExpectedGraduationYear" ]
then

cut -d " " -f5 ~/onsite1/ffile > ~/onsite1/temp_file1	
noof_lines=$(egrep -i -c $c2 ~/onsite1/temp_file1)			
egrep -i -n $c2 ~/onsite1/temp_file1 > ~/no.txt

fi

#sed -n 4p file.txt
i=1
while [ $i -le $noof_lines ] 
do

line1=$(sed -n "${i}p" "/home/zak/no.txt")
readarray -d : -t str <<< "$line1"
l_no="${str[0]}"
sed -n "${l_no}p" ~/onsite1/ffile
(( i++ ))

done


echo Do you want to search again Y or n
read ch
if [ $ch = "n" ]
then	
	break
fi

done

