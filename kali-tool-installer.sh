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
command -v curl > /dev/null 2>&1 || { echo >&2 "Curl is not installed"; }
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Installing Curl \e[0m\e[1;96m\en"
apt install curl -y
sleep 2
clear
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Installing Kali Linux Keyring \e[0m\e[1;96m\en"
curl -L https://archive.kali.org/archive-key.asc | apt-key add
clear
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Writing Kali Linux Source List [kali.list] \e[0m\e[1;96m\en"
sleep 1
echo "deb http://kali.download/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali.list
clear
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Updating... \e[0m\e[1;96m\en"
sleep 1
apt update -y 
clear
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Enter Package Name [Ex:nmap wget ]: \e[0m\e[1;96m\en' packages
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Installing $packages \e[0m\e[1;96m\en"
sleep 1
apt install $packages -y
clear
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Removing Kali Linux Keyring \e[0m\e[1;96m\en"
sleep 1
rm /etc/apt/trusted.gpg
clear
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Removing Kali Linux Source List [kali.list] \e[0m\e[1;96m\en"
sleep 1
rm /etc/apt/sources.list.d/kali.list
clear
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Updating... \e[0m\e[1;96m\en"
sleep 1
apt update -y 
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Installation Done \e[0m\e[1;96m\en"
sleep 2
clear
exit
