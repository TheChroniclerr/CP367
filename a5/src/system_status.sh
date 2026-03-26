#!/bin/bash
#-------------------------
# File: system_status.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-03-25
#-------------------------

# mail config:
# sudo apt update
# sudo apt install mailutils

CPU_THRESHOLD=80
MEM_THRESHOLD=95
DISK_THRESHOLD=80
EMAIL_ADDRESS="baox7248@mylaurier.ca"

cpu_utilization() {
    if [ -z "$1" ]; then
        echo "Usage: cpu_utilization <cpu_threshold_percentage>"
        return
    fi

    if [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
        echo "Enter the CPU threshold percentage between 0 to 100"
        return
    fi

    threshold=$1

    # Get CPU idle and compute usage
    # awk '{print $8}' references wrong values occassionally, thus this alternative is used
    cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk -F'id,' '{print $1}' | awk '{print $NF}' | cut -d. -f1)
    cpu_usage=$((100 - cpu_idle))

    if [ "$cpu_usage" -gt "$threshold" ]; then
        echo "CPU utilization: $cpu_usage%\nCPU warning!!!"
    else
        echo "CPU utilization: $cpu_usage%\nCPU ok!!!"
    fi
}

mem_free() {
    if [ -z "$1" ]; then
        echo "Usage: mem_free <free_memory_threshold_percentage>"
        return
    fi

    if [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
        echo "Enter the free memory threshold percentage between 0 to 100"
        return
    fi

    threshold=$1

    # Get memory info
    read total used <<< $(free | awk '/Mem:/ {print $2, $3}')
    free_mem=$((total - used))

    percent_free=$(awk "BEGIN {printf \"%.4f\", ($free_mem/$total)*100}")     # 4 decimal places
    percent_free_int=$(( free_mem * 100 / total ))                              # Int

    # Use percent_free_int for comparison, since it always truncate/round-down
    if [ "$percent_free_int" -lt "$threshold" ]; then
        echo "Free memory: $percent_free%\nMemory warning!!!"
    else
        echo "Free memory: $percent_free%\nMemory ok!!!"
    fi
}

disk_usage() {
    if [ -z "$1" ]; then
        echo "Usage: disk_usage <disk_threshold_percentage>"
        return
    fi

    if [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
        echo "Enter the disk usage threshold percentage between 0 to 100"
        return
    fi

    threshold=$1

    # Check all disks
    highest_usage=$(df -h | awk -v t="$DISK_THRESHOLD" '
    NR>1 {
        gsub("%","",$5)
        if ($5 > max) max=$5
    }
    END {
        print max
    }')

    # # Process substitution method
    # while read usage; do
    #     usage_val=$(echo $usage | tr -d '%')

    #     if [ "$usage_val" -gt "$threshold" ]; then
    #         warning_flag=1
    #         max_usage=$usage_val
    #     fi
    # done < <(df -h | awk 'NR>1 {print $5}')

    if [ "$highest_usage" -gt "$threshold" ]; then
        echo "Disk usage: $highest_usage%\nDisk warning!!!"
    else
        echo "Disk usage: $highest_usage%\nDisk ok!!!"
    fi
}

check_all() {
    msg+="##########################################\n"
    msg+="Testing CPU utilization, free memory, disk usage status of the system on $(date)\n"
    msg+="##########################################\n"

    msg+=$(cpu_utilization $CPU_THRESHOLD)
    msg+="\n##########################################\n"

    msg+=$(mem_free $MEM_THRESHOLD)
    msg+="\n##########################################\n"

    msg+=$(disk_usage $DISK_THRESHOLD)
    msg+="\n##########################################\n"

    echo $msg
}

send_report() {
    report=$(check_all)

    if [ -z "$1" ]; then
        report+="Usage: send_report <email_address>"
        report+="\n##########################################\n"
        echo "$report"
        return
    fi

    email=$1

    report+="Capturing the system status\n"
    report+="Sending email with the system status to $email"
    report+="\n##########################################\n"

    # Send email (mail must be configured)
    echo -e "$report" | mail -s "System Status Report" "$email"

    echo "$report"
}

# MAIN EXECUTION
echo -e $(send_report $EMAIL_ADDRESS)