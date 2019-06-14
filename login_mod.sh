#! /usr/bin/env bash

# Colors
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# Basic info
HOSTNAME=`uname -n`
RO=`mount -v | fgrep 'on / ' | cut -d " " -f1`
ROOT=`df -Ph | grep $RO | awk '{print $4}' | tr -d '\n'`
IPADDR=`hostname -I`
# System load
MEMORY1=`free -t -m | grep Total | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`
HOGGERS=`ps -Ao user,uid,comm,pid,pcpu,pmem,tty --sort=-pcpu | head -n 6`
WHO=$(who | awk '{print $1}' | grep -v root | sort -n | uniq -c | awk '{print $2}' | tr '\n' ','| sed 's/,$//
')
upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
secs=$((${upSeconds}%60))
mins=$((${upSeconds}/60%60))
hours=$((${upSeconds}/3600%24))
days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`


if [[ ${USER} != 'root' ]]; then
echo "


$(tput setaf 2)
===============================================
 - Who's here..........: $WHO
 - Hostname............: $HOSTNAME
 - Disk Space..........: $ROOT remaining
 - IP Address(es)......: $IPADDR
===============================================
 - CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
 - Memory used.........: $MEMORY1 / $MEMORY2
 - Swap in use.........: `free -m | tail -n 1 | awk '{print $3}'` MB
 - Uptime..............: ${UPTIME}
===============================================
 - Top 5 CPU and Mem hoggers

$HOGGERS

===============================================

$(tput sgr 0)"
fi
