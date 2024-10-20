#!/usr/bin/env bash

userinfo="84b26794fc7a"
host="84b26794fc7a.599ec69a.alu-cod.online"
archdir="archived_logs_group7"

if [ ! -d "$archdir" ]; then
        mkdir "$archdir"
else
        echo "The Information arleady exists"

fi

for File in heart_rate_log.txt_*; do
             mv "$File" "$archdir"

done

scp -r $archdir/ $userinfo@$host:/home/
