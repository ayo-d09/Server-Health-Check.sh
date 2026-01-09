#!/bin/bash

# Server Health Check Script
# Author: [ayo-d09]
# Purpose: Quick overview of Linux server health (CPU, memory, disk, load, etc.)
# Run as: ./server-health-check.sh
# Date: 2026-01-09

echo "============================================"
echo "     Server Health Check Report"
echo "     Hostname: $(hostname)"
echo "     Date: $(date)"
echo "     Uptime: $(uptime -p)"
echo "============================================"

echo -e "\n1. System Load Average (last 1/5/15 min):"
uptime | awk -F'load average:' '{ print $2 }'

echo -e "\n2. CPU Usage (top 10 processes):"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11

echo -e "\n3. Memory Usage (in MB):"
free -m

echo -e "\n4. Disk Usage (partitions, warning if >80%):"
df -h | awk 'NR==1 || $5+0 > 80 {print}'

echo -e "\n5. Top 10 Memory-Consuming Processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11

# Optional: Check specific services (uncomment and customize)
# echo -e "\n6. Key Services Status:"
# services=("ssh" "nginx" "apache2" "mysql")  # Add your services
# for service in "${services[@]}"; do
#     if systemctl is-active --quiet "$service"; then
#         echo "$service: RUNNING"
#     else
#         echo "$service: STOPPED or FAILED"
#     fi
# done

echo -e "\nHealth check complete!"