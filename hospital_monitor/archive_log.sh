#!/usr/bin/env bash

#Get the current timestamp for archiving

timestamp=$(date '+%Y%m%d_%H%M%S')

# Check if heart_rate_log.txt exists before renaming
if [ -f heart_rate_log.txt ]; then
    # Rename the log file with the timestamp in the format YYYYMMDD_HHMMSS
    mv heart_rate_log.txt heart_rate_log.txt_$timestamp
    echo "Log file archived as heart_rate_log.txt_$timestamp"
else
    echo "Error: heart_rate_log.txt not found."
fi

