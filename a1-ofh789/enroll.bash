#!/bin/bash

read -p "Enter a department code and course number(e.g., cs 3424): " dept_code course_num
read -p "Enter an enrollment change amount: " change_amt

filename="data/${dept_code^^}${course_num}.crs"

if [[ -e "$filename" ]];then

    read_file(){
        read dept_code dept_name
        read course_name
        read course_sched course_start course_end
        read course_hours
        read course_size
    }
read_file < "$filename"

    new_enroll=$((course_size + change_amt))
    course_size="$new_roll"

    
    echo "$dept_code $dept_name" > "$filename"
    echo "$course_name" >> "$filename"
    echo "$course_sched $course_start $course_end" >> "$filename"
    echo "$course_hours" >> "$filename"
    echo "$new_enroll" >> "$filename"
    echo "[$(date)] ENROLLMENT: $dept_code $course_num $course_name changed by $change_amt" >> data/queries.log

else
    echo "ERROR: course not found"
fi
