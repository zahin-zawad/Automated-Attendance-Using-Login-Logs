#!/bin/bash

INPUT="../attendance.csv"

echo "User Summary"
echo "-------------"

cut -d',' -f1 $INPUT | tail -n +2 | sort | uniq -c | while read count user
do
    echo "$user logged in $count times"
done