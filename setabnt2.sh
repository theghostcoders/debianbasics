#!/bin/bash

echo "=============================="
echo "=Set keyboard Layout br-abnt2="
echo "=============================="

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root. Please run with sudo or as root user."
  exit 1
fi

# Update package list and upgrade system packages
apt update && apt upgrade -y

# Install console-data package
apt install console-data -y

loadkeys br-abnt2

# Set keyboard layout to br-abnt2 in /etc/default/keyboard
sed -i 's/XKBLAYOUT=.*/XKBLAYOUT="br"/' /etc/default/keyboard
sed -i 's/XKBVARIANT=.*/XKBVARIANT="abnt2"/' /etc/default/keyboard

# Apply changes to console keymap
setupcon

echo "Keyboard layout set to br-abnt2."
