#!/bin/bash

echo " "
echo " "

# General system information using uname
os_type=$(uname)
hostname=$(hostname)
architecture=$(uname -m)


#  Static hostname: my-ubuntu
#        Icon name: computer-container
#          Chassis: container ☐
#       Machine ID: ef1a278442654b50b6fbf7ab8e4de7fe
#          Boot ID: fa87972f9b744c1bae0afa9f4421045b
#   Virtualization: lxc
# Operating System: Ubuntu 24.10
#           Kernel: Linux 6.12.15-orbstack-00304-gd0ddcf70447d
#     Architecture: arm64

# Check for macOS or Linux
if [ "$os_type" = "Darwin" ]; then
    # macOS specific commands
    os_version=$(sw_vers -productVersion)
    build_version=$(sw_vers -buildVersion)
    cpu_model=$(sysctl -n machdep.cpu.brand_string)
    disk_usage=$(df -h / | awk 'NR==2 {print $2 " " $3 " " $4}')
    
    # Display info similar to hostnamectl
    # echo -e "CPU:                 $cpu_model"
    echo -e "Static hostname:     $hostname"
    echo -e "Icon name:           "
    echo -e "Chassis:             "
    echo -e "Machine ID:          "
    echo -e "Boot ID:             "
    echo -e "Virtualization:      Not available on macOS"
    echo -e "Operating System:    macOS $os_version ($build_version)"
    echo -e "Kernel:              $(uname -r)"
    echo -e "Architecture:        $architecture"

elif [ "$os_type" = "Linux" ]; then
    # Linux specific commands
    os_version=$(lsb_release -d | awk -F "\t" '{print $2}')
    cpu_model=$(lscpu | grep "Model name" | sed 's/Model name:\s*//')
    
    # Static hostname and other system details
    static_hostname=$(hostname)
    chassis="container"  # Adjust if your system uses a different chassis type
    machine_id=$(cat /etc/machine-id)
    boot_id=$(cat /proc/sys/kernel/random/boot_id)
    virtualization="lxc"  # Can adjust based on actual virtualization type (e.g., Docker, KVM)

    # Display info similar to hostnamectl
    # echo -e "CPU:                 $cpu_model"
    echo -e "Static hostname:     $static_hostname"
    echo -e "Icon name:           computer-container"
    echo -e "Chassis:             $chassis"
    echo -e "Machine ID:          $machine_id"
    echo -e "Boot ID:             $boot_id"
    echo -e "Virtualization:      $virtualization"
    echo -e "Operating System:    $os_version"
    echo -e "Kernel:              $(uname -r)"
    echo -e "Architecture:        $architecture"
else
    echo "Unknown OS"
fi

#  Static hostname: my-ubuntu
#        Icon name: computer-container
#          Chassis: container ☐
#       Machine ID: ef1a278442654b50b6fbf7ab8e4de7fe
#          Boot ID: fa87972f9b744c1bae0afa9f4421045b
#   Virtualization: lxc
# Operating System: Ubuntu 24.10
#           Kernel: Linux 6.12.15-orbstack-00304-gd0ddcf70447d
#     Architecture: arm64

echo " "
echo " "