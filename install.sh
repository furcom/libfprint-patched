#!/bin/bash
echo -e "\n Installing packages..."
dnf install -y ./libfprint-1.94.6-1.fc40.x86_64.rpm
dnf install -y fprintd fprintd-pam

echo -e "\nCopying firmware files..."
cp ./libfpcbep.so /usr/lib/x86_64-linux-gnu/
cp -r lib/* /lib/
cp -r usr/* /usr/
mkdir -p /var/log/fpc

echo -e "\nEnabling fingerprint reader..."
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
