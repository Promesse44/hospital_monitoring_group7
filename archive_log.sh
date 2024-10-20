#!/usr/bin/env bash

logfile="heart_rate_log.txt"
time_stamp=$(date "+%Y%m%d_%H%M%S")

archive_file="${logfile}_${time_stamp}"

mv "$logfile" "$archive_file"
