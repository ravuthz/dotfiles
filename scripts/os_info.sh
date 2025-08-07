#!/bin/bash

echo " "
echo " "

# General system information using uname
uname -a

free_mac() {    
    total=$(sysctl -n hw.memsize)
    free=$(vm_stat | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
    inactive=$(vm_stat | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
    active=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
    wired=$(vm_stat | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
    page_size=$(sysctl -n hw.pagesize)

    total=$((total / 1024 / 1024 / 1024)) # Convert from bytes to GiB
    free=$((free * page_size / 1024 / 1024 / 1024)) # Convert from pages to GiB
    inactive=$((inactive * page_size / 1024 / 1024 / 1024)) # Convert from pages to GiB
    active=$((active * page_size / 1024 / 1024 / 1024)) # Convert from pages to GiB
    wired=$((wired * page_size / 1024 / 1024 / 1024)) # Convert from pages to GiB

    used=$(echo "$total - $free - $inactive" | bc) # Calculate used memory
   
    echo -e "               total\tused\tfree\tshared\tbuff/cache\tavailable"
    echo -e "Mem:\t\t${total}Gi\t${used}Gi\t${free}Gi\t-\t-\t${free}Gi"
    # echo -e "Swap:\t\t-\t\t0B\t\t${free}Gi\t-\t-\t-"
}


# Check for macOS or Linux
if [ "$(uname)" = "Darwin" ]; then
    echo "---------------------------------------------------------------------------------------------------------------------------------------------------"
    # macOS specific commands
    sw_vers  # macOS version info
    sysctl -n machdep.cpu.brand_string  # CPU model
   
    echo "Hostname:"
    scutil --get ComputerName  # Get the computer name
    echo "Free Memory (vm_stat):"
    vm_stat | grep "Pages free" | awk '{print $3}'  # Free memory using vm_stat

    echo "---------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Memory info:" && free_mac  # macOS memory info
    echo "---------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Disk usage:" && df -h /
else
    echo "---------------------------------------------------------------------------------------------------------------------------------------------------"
    # Linux specific commands
    if command -v lsb_release > /dev/null 2>&1; then
        lsb_release -a  # OS information using lsb_release
    else
        echo "lsb_release not found, using /etc/os-release"
        cat /etc/os-release  # Fallback to /etc/os-release
    fi
    if command -v hostnamectl > /dev/null 2>&1; then
        hostnamectl  # Hostname info using hostnamectl
    else
        echo "hostnamectl not found, using hostname"
        hostname  # Fallback to hostname command
    fi
    
    echo "---------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Memory info:" && free -h
    echo "---------------------------------------------------------------------------------------------------------------------------------------------------"
    echo "Disk usage:" && df -h /
fi

echo " "
echo " "