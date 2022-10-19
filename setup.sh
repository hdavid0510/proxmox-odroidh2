#!/bin/bash

echo -e "\033[103m\033[30m\033[1m  ODROID H2 PROXMOX initial setup  \033[0m"


echo -e "\n\033[93m\033[1mEdit APT repository\033[0m"

sed -i 's|deb https://enterprise.proxmox.com/debian/pve bullseye pve-enterprise|# deb https://enterprise.proxmox.com/debian/pve bullseye pve-enterprise|g' /etc/apt/sources.list.d/pve-enterprise.list
echo -e "deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" | tee /etc/apt/sources.list.d/pve-no-subscription.list
apt update


echo -e "\n\033[93m\033[1mInstall byobu\033[0m"

tar -xzf byobu.tar.gz --directory ~/
apt install byobu -y
byobu-enable


[ -f ./setup/supporess-subs.sh ] && chmod +x ./setup/supporess-subs.sh && ./setup/supporess-subs.sh

[ -f ./setup/igfx.sh ] && chmod +x ./setup/igfx.sh && ./setup/igfx.sh

[ -f ./setup/sysmon-oled.sh ] && chmod +x ./setup/sysmon-oled.sh && ./setup/sysmon-oled.sh

echo -e "\n\033[0;32m\xE2\x9C\x94\033[0m \033[92m\033[1mPROXMOX INIT SETUP FINISHED\033[0m"