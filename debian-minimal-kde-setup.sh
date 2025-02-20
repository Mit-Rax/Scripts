#!/bin/bash
#coded by MitRax

# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
# ...
clear

apt install --no-install-recommends kde-plasma-desktop konsole sddm kde-config-sddm -y
apt install --no-install-recommends bluez plasma-nm plasma-pa vlc gwenview -y
apt install --no-install-recommends dolphin dolphin-plugins unzip firefox-esr -y
apt install --no-install-recommends systemsettings kwin-x11 qml-module-org-kde-kitemmodels -y
apt install --no-install-recommends bash-completion plymouth plymouth-themes grub2 -y
apt install --no-install-recommends curl wget git nano bluetooth bluez-tools -y
apt install --no-install-recommends pulseaudio-module-bluetooth bluedevil -y
apt install ark kmenuedit -y 

apt remove konqueror -y
apt autoremove -y 

systemctl enable sddm

systemctl enable NetworkManager
systemctl start NetworkManager

systemctl enable bluetooth
systemctl start bluetooth

echo "rinc-hart ALL=(ALL:ALL) ALL" >> /etc/sudoers





