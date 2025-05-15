#!/bin/bash

read -p "Department code: " dept_code
read -p "Department name: " dept_name
read -p "Course number: " course_num
read -p "Course name: " course_name
read -p "Scheduled days: " course_sched
read -p "Course start: " course_start
read -p "Course end: " course_end
read -p "Credit hours: " course_hours
read -p "Enrolled students: " course_size

filename="data/${dept_code^^}${course_num}.crs"

if [[ -e "$filename" ]]; then

    read_file(){
        read dept_code dept_name 
        read course_name 
        read course_sched course_start course_end 
        read course_hours 
        read course_size
    }
    read_file < "$filename"
    
    if [[ -z "$new_dept_code" ]]; then
        new_dept_code="$dept_code"
    fi
    if [[ -z "$new_dept_name" ]]; then
        new_dept_name="$dept_name"
    fi
    if [[ -z "$new_course_num" ]]; then
        new_course_num="$course_num"
    fi
    if [[ -z "$new_course_name" ]]; then
        new_course_name="$course_name"
    fi
    if [[ -z "$new_course_sched" ]]; then
        new_course_sched="$course_sched"
    fi
    if [[ -z "$new_course_start" ]]; then
        new_course_start="$course_start"
    fi
    if [[ -z "$new_course_end" ]]; then
        new_course_end="$course_end"
    fi
    if [[ -z "$new_course__hours" ]]; then
        new_course_hours="$course_hours"
    fi
    if [[ -z "$new_course_size" ]]; then
        new_course_size="$course_size"
    fi

    
    echo "$new_dept_code $new_dept_name" > "$filename"
    echo "$new_course_name" >> "$filename"
    echo "$new_course_sched $new_course_start $new_course_end" >> "$filename"
    echo "$new_course_hours" >> "$filename"
    echo "$new_course_size" >> "$filename"

    echo "[$(date)] UPDATED: $new_dept_code $new_course_num $new_course_name" >> data/queries.log
else
    echo "ERROR: course not found"
fi












