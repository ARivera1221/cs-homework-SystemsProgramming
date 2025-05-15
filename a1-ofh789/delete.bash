#!/bin/bash

read -p "Enter a department code and course number: " dept_code course_num

filename="data/${dept_code^^}${course_num}.crs"

if [[ -e "$filename" ]];then

    delete_file(){
         echo "[$(date)] DELETED: $dept_code $course_num $course_name" >> data/queries.log
         rm "$filename"
         echo "$course_num was succesfully deleted."
    }
delete_file < "$filename"
else
    echo "ERROR: course not found"
fi
