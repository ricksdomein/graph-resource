#!/bin/sh
# Usage: ./monitor-usage.sh <PID of the process>
trap 'echo oh, I am slain; exit' INT
export PID=$1
rm top.dat
while true; do top -p $PID -bn 1 | sed 1,2d | awk -v now=$(date +%s) '{print now,$9,$10}'>> top.dat; done
#while true; do top -p $PID -bn 1 | sed 1,7d | awk -v now=$(date +%s) '{print now,$9,$10}'>> top.dat; done
