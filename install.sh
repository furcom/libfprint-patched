#!/bin/bash

# Install packages
dnf install -y ./libfprint-*.rpm
dnf install -y fprintd
dnf install -y fprintd-pam

# Copy firmware files
cp -rf ./libfpcbep.so /usr/lib64/
cp -rf ./lib/* /lib/
cp -rf ./usr/* /usr/
mkdir -p /var/log/fpc

# Enable fprintd
systemctl start fprintd
systemctl enable fprintd
authselect enable-feature with-fingerprint
authselect apply-changes

echo -e "\n\033[0;32mFINISHED!"
echo -e "\n\033[1;33mExecute following command after rebooting your system to register your finger:\033[0m"
echo "fprintd-enroll your_username"
echo -e "\nPress any key to exit..." 
read -p ""
exit
