#!/bin/bash

# Script to set up KVM on Ubuntu

echo "Checking CPU virtualization support..."
if [[ $(egrep -c '(vmx|svm)' /proc/cpuinfo) -eq 0 ]]; then
    echo "Virtualization is not supported on this machine."
    exit 1
else
    echo "CPU virtualization is supported."
fi

echo "Installing required packages..."
sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

echo "Adding current user to 'libvirt' and 'kvm' groups..."
sudo usermod -aG libvirt "$USER"
sudo usermod -aG kvm "$USER"

echo "Verifying and starting libvirtd service..."
sudo systemctl enable libvirtd
sudo systemctl start libvirtd

echo "Checking KVM kernel modules..."
if ! lsmod | grep -q kvm; then
    echo "Loading KVM kernel modules..."
    sudo modprobe kvm
    sudo modprobe kvm_intel 2>/dev/null || sudo modprobe kvm_amd
else
    echo "KVM modules already loaded."
fi

echo "Verifying /dev/kvm permissions..."
if [ -e /dev/kvm ]; then
    sudo chown root:kvm /dev/kvm
    sudo chmod 660 /dev/kvm
    echo "/dev/kvm permissions set."
else
    echo "/dev/kvm not found. You might be running in WSL or a restricted environment."
fi

echo "Setup complete. You may need to reboot or log out/in for group changes to take effect."

virt-manager 
