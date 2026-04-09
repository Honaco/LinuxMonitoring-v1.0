#!/bin/bash

HOSTNAME() {
    hostname
}

TIMEZONE() {
    timedatectl | grep "Time zone" | awk '{print $3, $4, $5}'
}

USER() {
    echo $USER
}

OS() {
    grep -oP 'PRETTY_NAME="\K[^"]+' /etc/os-release
}

DATE() {
    date "+%d %b %Y %H:%M:%S"
}

UPTIME() {
    uptime -p
}

UPTIME_SEC() {
    awk '{print int($1)}' /proc/uptime
}

IP() {
    hostname -I | awk '{print $1}'
}

MASK() {
    ip -o -4 addr show | awk '/scope global/ {print $4}' | cut -d'/' -f2
}

GATEWAY() {
    ip route | grep default | awk '{print $3}'
}

RAM_TOTAL() {
    free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}'
}

RAM_USED() {
    free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}'
}

RAM_FREE() {
    free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}'
}

SPACE_ROOT() {
    df -BM / | awk 'NR==2 {printf "%.2f MB", $2}'
}

SPACE_ROOT_USED() {
    df -BM / | awk 'NR==2 {printf "%.2f MB", $3}'
}

SPACE_ROOT_FREE() {
    df -BM / | awk 'NR==2 {printf "%.2f MB", $4}'
}