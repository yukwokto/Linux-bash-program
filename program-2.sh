#!/bin/bash -u
PATH=/bin:/usr/bin ; export PATH
umask 022

# checking if there are enough arguments
if [ $# -lt 1 ];then
        echo "The program lacks sufficient arguments" >&2
        exit 1
fi

# populating the array
student_array=()
array_size=0

while [ "$#" -gt 0 ]; do
        student_name=$(echo "$1" | cut -d: -f 2)
        student_grade=$(echo "$1"| cut -d: -f 3)

        if [ $(echo "$1" | cut -d: -f 3 ) -ge 0 ] && [ $(echo "$1" | cut -d: -f 3 ) -le 100 ]; then
                student_array[$array_size]="$1"
                array_size=$(($array_size + 1))
                shift
        else
                echo "Invalid grade ($student_grade) for $student_name. Value must range from 0 to 100." >&2
                exit 10
        fi
done

# checking all elements exist in the array
# echo "${student_array[@]}"

# removing pre-existing stats.txt
rm stats.txt 2>/dev/null

# creating stats.txt
touch stats.txt

# adding last 4 digits of my student number to stats.txt
echo "#0504" >>stats.txt

# adding the number of students to stats.txt
ARRAY_SIZE=${#student_array[*]}
echo "NUM_STUDS=$ARRAY_SIZE" >>stats.txt


# declare variables for holding information about exam statistics
sum=0

max_id=0
max_name=""
max_grade=0

min_id=0
min_name=""
min_grade=101

# array operations
for i in "${student_array[@]}"
do
        # calculate the total marks for later average computation
        sum=$(($sum + $(echo $i | cut -d: -f 3 )))

        # find out the student who has the maximum grade
        if [ "$(echo $i | cut -d: -f 3)" -gt "$max_grade" ];then
                max_id=$(echo $i | cut -d: -f 1)
                max_name=$(echo $i | cut -d: -f 2)
                max_grade=$(echo $i | cut -d: -f 3)
        fi

        # find out the student who has the minimum grade
        if [ "$(echo $i | cut -d: -f 3)" -lt "$min_grade" ];then
                min_id=$(echo $i | cut -d: -f 1)
                min_name=$(echo $i | cut -d: -f 2)
                min_grade=$(echo $i | cut -d: -f 3)
        fi


done

# calculate the average mark amongst students, and add it to stats.txt
AVG=$((sum/ARRAY_SIZE))
echo "AVG=$AVG" >>stats.txt

# add student's id, name, grade who has the highest grade to stats.txt
echo "TOP_ID=$max_id" >>stats.txt
echo "TOP_NAME=$max_name" >>stats.txt
echo "TOP_GRADE=$max_grade" >>stats.txt

# add student's id, name, grade who has the lowest grade to stats.txt
echo "BOTTOM_ID=$min_id" >>stats.txt
echo "BOTTOM_NAME=$min_name" >>stats.txt
echo "BOTTOM_GRADE=$min_grade" >>stats.txt

