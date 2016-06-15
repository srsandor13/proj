#!/bin/sh
#this script uses loop to generate tree

#set variable for # of trees

$ new_Directories=n

for i in $(seq 1 new_Directories); do
        mkdir /home/ssandor4/proj/q1_dir.sh${i}
        cd /home/ssandor4/proj/q1_dir.sh${i}
        mkdir html cgi
        touch Changes.txt Makefile.txt
done

