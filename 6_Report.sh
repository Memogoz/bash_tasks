#!/bin/bash
# Report of local system info (Linux)

echo "=== SYSTEM REPORT ===" > report.txt 2>&1
echo "Current date and time: `date`" >> report.txt 2>&1
echo "Current user: `whoami`" >> report.txt 2>&1
echo "Internal IP adress and hostname: `ip -4 addr show scope global | grep inet | awk '{print $2}'` `hostname`" >> report.txt 2>&1
echo "External IP address: `curl -s ifconfig.me`" >> report.txt 2>&1
echo "Name and version of Linux distribution: `cat /etc/os-release | grep -E "^NAME="` `cat /etc/os-release | grep -E "^VERSION="`" >> report.txt 2>&1
echo "System uptime: `uptime`" >> report.txt 2>&1
echo -e "Used and free space: \n`df -h /`" >> report.txt 2>&1
echo -e "Total and free RAM: \n`free -h`" >> report.txt 2>&1
echo -e "Number and frequency of CPU cores: \n`cat /proc/cpuinfo | grep -E "processor|cpu MHz"`" >> report.txt 2>&1

if [[ $? -eq 0 ]]; then
    echo "Report succesfully created as report.txt"
else
    echo "Error while building report, check output at report.txt"
fi