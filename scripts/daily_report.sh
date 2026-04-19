#!/bin/bash

TODAY_MONTH=$(date +"%b")
TODAY_DAY=$(date +"%d")
TODAY_FULL=$(date +"%Y-%m-%d")

OUTPUT="../reports/daily_$TODAY_DAY.txt"

echo "==========================================" > $OUTPUT
echo "      DAILY ATTENDANCE REPORT" >> $OUTPUT
echo "      Date: $TODAY_FULL" >> $OUTPUT
echo "==========================================" >> $OUTPUT
echo "" >> $OUTPUT

printf "%-10s %-20s %-22s %-22s %-10s\n" "User" "Full Name" "Login Time" "Logout Time" "Duration" >> $OUTPUT
echo "-----------------------------------------------------------------------------------------------------------" >> $OUTPUT

last -F | grep "$TODAY_MONTH $TODAY_DAY" | grep -v "reboot" | grep -v "wtmp" | while read -r line
do
    USER=$(echo "$line" | awk '{print $1}')

    FULLNAME=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)

    LOGIN=$(echo "$line" | awk '{print $4, $5, $6, $7, $8}')
    LOGOUT=$(echo "$line" | awk '{print $10, $11, $12, $13, $14}')
    DURATION=$(echo "$line" | grep -oP '\(\K[^\)]+')

    # Skip still logged in users
    if echo "$line" | grep -q "still logged in"; then
        continue
    fi

    printf "%-10s %-20s %-22s %-22s %-10s\n" \
    "$USER" "$FULLNAME" "$LOGIN" "$LOGOUT" "$DURATION" >> $OUTPUT

done

echo "" >> $OUTPUT
echo "==========================================" >> $OUTPUT
echo "Report generated at: $(date)" >> $OUTPUT
echo "==========================================" >> $OUTPUT

echo "✅ Clean daily report generated: $OUTPUT"