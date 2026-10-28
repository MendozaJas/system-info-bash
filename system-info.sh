#!/bin/bash
echo "===== SYSTEM INFORMATION ====="
echo "Hostname:"
hostname
echo "Current User:"
whoami
echo "Operating System:"
cat /etc/os-release
echo "Kernel Version:"
uname -r
echo "Memory Information:"
free -h
echo "Disk Usage:"
df -h
echo "IP Address:"
hostname -I
echo "CPU Information"
lscpu
