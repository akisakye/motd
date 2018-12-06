# motd
Shiny Messages of the Day for Linux Servers

# Use
When managing multiple Linux servers, you occassionally need a simple dashboard with info about the server you just logged into.
This script manipulates the inherint motd feature of Unix like Operating Systems.

# Example

===============================================
 - Hostname............: hostname.domain.com
 - Disk Space..........: 67G remaining
 - IP Address(es)......: 192.168.10.10 
===============================================
 - CPU usage...........: 0.22, 0.20, 0.21 (1, 5, 15 min)
 - Memory used.........: 3555 MB / 7655 MB
 - Swap in use.........: 0 MB
===============================================
 - Top 5 CPU and Mem hoggers
 
USER       UID COMMAND           PID %CPU %MEM TT
root         0 sudo             4014  0.5  0.0 pts/0
root         0 kworker/1:2      3240  0.2  0.0 ?
root         0 kworker/1:1      3978  0.2  0.0 ?

===============================================


# Usage
Simply copy login_mod.sh to /etc/profile.d/login_mod.sh. If you have a large estate, you can also use config management like Puppet to copy and place the file for you

# Feedback
kisakye [at[ gmail.com
