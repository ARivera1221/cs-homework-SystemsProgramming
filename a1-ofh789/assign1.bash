#!/bin/bash
go=0
while [ $go ]; do
    echo "Enter one of the following actions or press CTRL-D to exit."
    echo "C - create a new course record"
    echo "R - read an existing course record"
    echo "U - update an existing course record"
    echo "D - delete an existing course record"
    echo "E - update enrolled student count of existing course"
    echo "T - show total course count"

    if ! read ans; then
        # got EOF
        break
    fi
    
    case "$ans" in 
        [Cc])
        ./create.bash
        ;;
        [Rr])
        ./read.bash
        ;;
        [Uu])
        ./update.bash
        ;;
        [Dd])
        ./delete.bash
        ;;
        [Ee])
        ./enroll.bash
        ;;
        [Tt])
        ./total.bash
        ;;
        *) echo "Error: Enter valid input."
        esac
    done
