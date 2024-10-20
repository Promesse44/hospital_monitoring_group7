#!/usr/bin/env bash

group_number=7  # Replace with your actual group number
remote_host="your_remote_host"  # Replace with the actual remote host
remote_user="your_username"  # Replace with the actual username
remote_dir="/home/your_directory/"  # Replace with the actual remote directory on the backup server

# Create archive directory if it doesn't exist
archive_dir="archived_logs_group$group_number"
mkdir -p "$archive_dir"

# Move all archived log files into the archive directory
if mv heart_rate_log.txt_* "$archive_dir"/; then
    echo "All archived log files have been moved to $archive_dir/"
else
    echo "No archived log files found to move."
fi

# Secure backup using SCP (SSH)
echo "Backing up archived logs to the remote server..."
scp "$archive_dir"/* "$remote_user@$remote_host:$remote_dir"

# Check if SCP was successful
if [ $? -eq 0 ]; then
    echo "Backup complete. All archived logs are now on the remote server."
else
    echo "Backup failed. Please check your SSH credentials or server connection."
fi

