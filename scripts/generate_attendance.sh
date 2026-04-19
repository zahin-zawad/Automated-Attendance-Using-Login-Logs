#!/bin/bash

MONTH=$(date +"%b")
OUTPUT="../attendance.csv"

echo "Username,Full Name,Login Time,Logout Time,Duration" > $OUTPUT

echo "Generating clean attendance..."

last -F | grep "$MONTH" | grep -v "reboot" | grep -v "wtmp" | while read -r line
do
    USER=$(echo "$line" | awk '{print $1}')

    # Get full name from system
    FULLNAME=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)

    # Extract login and logout safely
    LOGIN=$(echo "$line" | awk '{print $4, $5, $6, $7, $8}')
    LOGOUT=$(echo "$line" | awk '{print $10, $11, $12, $13, $14}')

    DURATION=$(echo "$line" | grep -oP '\(\K[^\)]+')

    # Skip still logged in
    if echo "$line" | grep -q "still logged in"; then
        continue
    fi

    echo "$USER,$FULLNAME,$LOGIN,$LOGOUT,$DURATION" >> $OUTPUT

done

echo "Done! Now CSV is clean and accurate."