#!/bin/bash

re='^[0-9]+$'
re2='^[A-Za-z]+$'
print_all_files=1
print_dir=0
print_n=0
print_l=0
for item in $*
do
    if [ "$item" = "-d" ]; then
        print_dir=1
    fi
    
    if [ "$item" = "-n" ]; then
        print_n=1
        print_all_files=0
    fi
    
    if [ "$item" = "-l" ]; then
        print_all_files=0
        print_l=1
    fi
done

if [ $print_dir = 1 ]; then
    echo $(ls -d */)
fi

if [ $print_all_files = 1 ]; then
    echo $(ls -p | grep -v /)
fi

if [ $print_n = 1 ] && [ $print_l = 0 ]; then
    for item in $(ls -p | grep -v /)
    do
        if [[ $(tail $item -n 1 -c 1 | grep -e [0-9]) =~ $re ]]; then
            echo $item
        fi
    done
fi

if [ $print_l = 1 ] && [ $print_n = 0 ]; then
    for item in $(ls -p | grep -v /)
    do
        if [[ $(tail $item -n 1 | head $item -c 1 | grep -e [A-Za-z]) =~ $re2 ]]; then
            echo $item
        fi
    done
fi

if [ $print_l = 1 ] && [ $print_n = 1 ]; then
    for item in $(ls -p | grep -v /)
    do
        if [[ $(tail $item -n 1 -c 1 | grep -e [0-9]) =~ $re ]] && [[ $(tail $item -n 1 | head $item -c 1 | grep -e [A-Za-z]) =~ $re2 ]]; then
            echo $item
        fi
    done
fi