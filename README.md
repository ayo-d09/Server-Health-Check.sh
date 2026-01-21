# Server Health Check Script

A simple, lightweight Bash script to monitor Linux server health. Checks CPU, memory, disk usage, load average, and top processes. Perfect for quick diagnostics.

## Features
- No external dependencies (uses native Linux commands)
- Clean, colored output (optional – add colors if desired)
- Warns on high disk usage (>80%)
- Easy to extend (add service checks, thresholds, email alerts)
- Tested on Ubuntu, Debian derivatives

## Installation
´´´bash
git clone https://github.com/yourusername/server-health-check.git
cd server-health-check
chmod +x server-health-check.sh


