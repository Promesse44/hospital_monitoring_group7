#!/usr/bin/env bash

userinfo="84b26794fc7a"
host="84b26794fc7a.599ec69a.alu-cod.online"
archdir="archived_logs_group7"

if [ ! -d "$archdir" ]; then
    mkdir "$archdir"
    echo "Directory $archdir created."
else
    echo "The directory $archdir already exists."
fi

for file in heart_rate_log.txt_*; do
    if [ -e "$file" ]; then
        mv "$file" "$archdir"
        echo "Moved $file to $archdir."
    else
        echo "No archived files found to move."
        break
    fi
done

echo "Starting backup to remote server..."
scp -r "$archdir/" "$userinfo@$host:/home/"

if [ $? -eq 0 ]; then
    echo "Backup complete. Archived logs have been copied to the remote server."
else
    echo "Backup failed. Please check your SSH connection or credentials."
fi

