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
command -v curl > /dev/null 2>&1 || { echo >&2 "Curl is not installed"; }
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Installing Curl \e[0m\e[1;96m\en"
apt install curl -y
clear

command -v figlet > /dev/null 2>&1 || { echo >&2 "Figlet is not installed"; }
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Installing Figlet \e[0m\e[1;96m\en"
apt install figlet -y
clear

command -v lolcat > /dev/null 2>&1 || { echo >&2 "Lolcat is not installed"; }
printf "\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Installing Lolcat \e[0m\e[1;96m\en"
apt install lolcat -y
clear

figlet -f digital  " Writing Sources.list " 
echo "deb http://ftp.cn.debian.org/debian sid main" | sudo tee /etc/apt/sources.list.d/debian-12.list
sleep 2
clear

figlet -f digital  " Updating Source List " 
apt update -y
sleep 2
clear

figlet -f slant  " JAVA 8 " 
apt install openjdk-8-jre* openjdk-8-jdk* -y 
sleep 2
clear 

figlet -f digital  " Removing Sources.list " 
rm /etc/apt/sources.list.d/debian-12.list
sleep 2
clear

figlet -f digital  " Updating Source List " 
apt update -y
sleep 2
clear

figlet -f digital  " JAVA 8 INSTALLED" 
















