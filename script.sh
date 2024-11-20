#!/bin/zsh

current_time="$(date +"%B %d, %Y %T")"
current_time_epoch="$(date +"%s")"
#insert desired scheduled time here
scheduled_time="$(date +"%B %d, %Y %T" -d 2024-11-21)"
scheduled_time_epoch=$(date --date=$scheduled_time +%s)
countdown=$((scheduled_time_epoch-current_time_epoch))

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
