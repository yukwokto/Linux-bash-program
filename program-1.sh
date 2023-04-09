#!/bin/sh -u
PATH=/bin:/usr/bin ; export PATH
umask 022

# check if there are enough arguments, if only the name of file is provided,
# program exits with error status 1

if [ $# -le 1 ];then
        echo "program lacks sufficient arguments" >&2
        exit 1
fi

# remove the file if a file with the same name exit, hide default message.
file_name="$1.txt"
rm "$file_name" 2>/dev/null; touch "$file_name"
shift

# append student number to the text file
echo '#0504' >>"$file_name";

# record question number
q_count=1
while [ $# -ge 1 ]; do
        case "$1" in
                1 )
                        echo "$q_count) A" >>"$file_name"
                        q_count=$((q_count + 1))
                        shift;;
                2 )
                        echo "$q_count) B" >>"$file_name"
                        q_count=$((q_count + 1))
                        shift;;
                3 )
                        echo "$q_count) C" >>"$file_name"
                        q_count=$((q_count + 1))
                        shift;;
                4 )
                        echo "$q_count) D" >>"$file_name"
                        q_count=$((q_count + 1))
                        shift;;
                5 )
                        echo "$q_count) E" >>"$file_name"
                        q_count=$((q_count + 1))
                        shift;;
                "-" )
                        echo "$q_count) -" >>"$file_name"
                        q_count=$((q_count + 1))
                        shift;;
                * )
                        rm "$file_name"
                        echo "(error output as described above, stating that "$1" is the cause of the error)" >&2
                esac
done
