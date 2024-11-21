#!/bin/sh

current_time=$(date +"%B %d, %Y %T")
current_time_epoch=$(date +"%s")
#insert desired scheduled time here in format YYYY-MM-DD hh:mm:ss
scheduled_time="2024-11-22 00:00:00"

scheduled_time=$(date +"%B %d, %Y %T" -d "$scheduled_time")
scheduled_time_epoch=$(date -u +%s -d "$scheduled_time")
countdown=$(( scheduled_time_epoch-current_time_epoch ))

echo "Current time: $current_time"
echo "Scheduled time: $scheduled_time"
echo $countdown

while [[ $countdown -gt 0 ]]
do
    echo "Remaining time:"
    printf '%02dh:%02dm:%02ds\n' $((countdown/3600)) $((countdown%3600/60)) $((countdown%60))
    sleep 10
    current_time_epoch="$(date +"%s")"
    countdown=$((scheduled_time_epoch-current_time_epoch))
done

#git add .
#git commit -m"message"
git push
