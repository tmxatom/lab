#!/bin/bash

# Open a new bash shell at the start
clear

# Check if running as root
if [ "$(id -u)" -eq 0 ]; then
    echo "Please don't run this script as root or with sudo."
    echo "The script will use sudo when needed."
    exit 1
fi

# Detect if running in WSL
WSL=false
if grep -q Microsoft /proc/version || grep -q WSL /proc/version; then
    WSL=true
fi

# Install KVM and related tools
echo "sudo apt update"
sudo apt update

echo "sudo apt install -y qemu-kvm libvirt-daemon-system virtinst bridge-utils virt-manager"
sudo apt install -y qemu-kvm libvirt-daemon-system virtinst bridge-utils virt-manager

# Add user to necessary groups
echo "sudo usermod -aG libvirt \$USER"
sudo usermod -aG libvirt "$USER"

echo "sudo usermod -aG kvm \$USER"
sudo usermod -aG kvm "$USER"

# Start and enable libvirt service
if $WSL; then
    echo "sudo service libvirtd start"
    sudo service libvirtd start
else
    echo "sudo systemctl start libvirtd"
    sudo systemctl start libvirtd

    echo "sudo systemctl enable libvirtd"
    sudo systemctl enable libvirtd
fi

# Configure GUI access
if $WSL; then
    if ! grep -q "export DISPLAY=" ~/.bashrc; then
        echo "echo 'export DISPLAY=\$(grep -m 1 nameserver /etc/resolv.conf | awk \"{print \\$2}\"):0.0' >> ~/.bashrc"
        echo 'export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk "{print \$2}"):0.0' >> ~/.bashrc

        echo "echo 'export LIBGL_ALWAYS_INDIRECT=1' >> ~/.bashrc"
        echo 'export LIBGL_ALWAYS_INDIRECT=1' >> ~/.bashrc
    fi

    echo "export DISPLAY=\$(grep -m 1 nameserver /etc/resolv.conf | awk '{print \$2}'):0.0"
    export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0

    echo "export LIBGL_ALWAYS_INDIRECT=1"
    export LIBGL_ALWAYS_INDIRECT=1
fi

# Finished setup
read -rp "Would you like to launch virt-manager now? (y/n): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "virt-manager"
    virt-manager
fi

