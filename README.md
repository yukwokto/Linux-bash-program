# Linux-bash-program
A repository showcasing small bash program developed by me.

## Program 1
This Bash program is designed to create a text file with student answers for multiple-choice questions. 
The program requires a minimum of two arguments - the name of the text file to be created and a series of integers representing the answers to the multiple-choice questions.

This program requires Bash to run. It should work on most Unix-based systems.

To use this program, run the script with the following arguments:
```bash
./program-1.sh [filename] [answer1] [answer2] [answer3] ...
```

The program will create a new text file with the provided filename and append the student's ID number and answers to the file. 
The answers should be provided as integers from 1-5 or "-" to represent a skipped question.

### Error Handling
If the program is run without the minimum required number of arguments, an error message will be displayed, and the program will exit with an error status of 1.

If an unrecognized answer is provided, an error message will be displayed, and the program will exit with an error status of 1. In this case, the text file will not be created or modified.


## Program 2

This bash program is designed to take input arguments in the form of id:name:grade and then generate a stats.txt file that includes the following information:

- The last 4 digits of the author's student number
- The number of students in the input
- The average grade of all the students
- The student with the highest grade, including their ID, name, and grade
- The student with the lowest grade, including their ID, name, and grade

### Usage
To use this program, run the program-1.sh script followed by one or more arguments in the format of id:name:grade, like so:
```bash
./program-2.sh id1:name1:grade1 id2:name2:grade2 id3:name3:grade3 ...
```

### Input Validation
The program checks if there are enough arguments and if the grade value for each student is between 0 and 100, inclusive. 
If there is an insufficient number of arguments or an invalid grade value, the program will output an error message and terminate.


### Output
The program generates a file named stats.txt which includes the following information:
```bash
#0504  # This is the last 4 digits of the author's student number
NUM_STUDS=n  # This is the number of students in the input
AVG=x  # This is the average grade of all the students
TOP_ID=y  # This is the ID of the student with the highest grade
TOP_NAME=z  # This is the name of the student with the highest grade
TOP_GRADE=a  # This is the grade of the student with the highest grade
BOTTOM_ID=b  # This is the ID of the student with the lowest grade
BOTTOM_NAME=c  # This is the name of the student with the lowest grade
BOTTOM_GRADE=d  # This is the grade of the student with the lowest grade
```
Note that n, x, y, z, a, b, c, and d are replaced with the actual values calculated by the program. 
If the stats.txt file already exists, the program will remove it before creating a new one. 
If the program encounters any errors during execution, it will output an error message and terminate.



