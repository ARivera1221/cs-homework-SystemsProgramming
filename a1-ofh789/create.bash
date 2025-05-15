#!/bin/bash

read -p "Department code: " dept_code
read -p "Department name: " dept_name
read -p "Course number: " course_num
read -p "Course name: " course_name
read -p "Course schedule (MWF or TH): " course_sched
read -p "Course start date (mm/dd/yy): " course_start
read -p "Course end date (mm/dd/yy): " course_end
read -p "Course credit hours: " course_hours
read -p "Initial course enrollment: " course_size

mkdir -p data

filename="${dept_code^^}${course_num}.crs"



if [[ -e "data/$filename" ]]; then
    echo "ERROR: course already exist"
else
    echo "$dept_code $dept_name" > "data/$filename"
    echo "$course_name" >> "data/$filename"
    echo "$course_sched $course_start $course_end" >> "data/$filename"
    echo "$course_hours" >> "data/$filename"
    echo "$course_size" >> "data/$filename"
    echo "[$(date)] CREATED: $dept_code $course_num $course_name" >> data/queries.log
fi
