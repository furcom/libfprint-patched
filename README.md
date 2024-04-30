# Bash script to enable fingerprint scanner on ThinkPad E14 Gen5 running Fedora Linux (Could work on other distros with dnf package manager too)
Patched libfprint for FPC fingerprint scanner with ID 10a5:9800.

Rebuilt from xuwd1's AUR package: https://aur.archlinux.org/packages/libfprint-fpcmoh-git

## How to install:
1. Clone repository:
```
git clone https://github.com/furcom/libfprint-patched.git
```
2. Make script executable and run it:
```
chmod +x ./install.sh && ./install.sh
```
3. Reboot system and execute following:
```
fprintd-enroll your_username
```
