#!/bin/bash
dst_address="<target address>"

while true
do
    curent_date=$(date '+%m.%d.%y')
    #echo $curent_date
    curent_time=$(date '+%H:%M:%S')
    #echo $curent_time
    address=$(ping -c 1 $dst_address | head -n2 | tail -n 1 | awk '{print $5}' | cut -d '(' -f 2 | cut -d ')' -f1)
    #echo $address
    ttl=$(ping -c 1 $dst_address | head -n2 | tail -n 1 | awk '{print $7}' | cut -d = -f 2)
    #echo $ttl
    resp_time=$(ping -c 1 $dst_address | head -n2 | tail -n 1 | awk '{print $8}' | cut -d = -f 2)
    #echo $resp_time
    row="${curent_date},${curent_time},${address},${ttl},${resp_time}"
    #echo $row >> <path to file>/log_ping_timestamp.csv
    echo $row
    sleep 1
done