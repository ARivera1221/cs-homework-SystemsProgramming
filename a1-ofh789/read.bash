#!/bin/bash

read -p "Enter a department code and course number(e.g., cs 3424): " dept_code course_num

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
    
    echo "Course department: ${dept_code^^} $dept_name"
    echo "Course number: $course_num"
    echo "Course name: $course_name"
    echo "Scheduled days: $course_sched"
    echo "Course start: $course_start"
    echo "Course end: $course_end"
    echo "Credit hours: $course_hours"
    echo "Enrolled Students: $course_size"
else
    echo "ERROR: course not found"
fi

