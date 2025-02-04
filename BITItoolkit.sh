#!/bin/bash
echo "  ____ _____       _______ _____ "
echo " |  _ \_   _|     |__   __|_   _|"
echo " | |_) || |          | |    | |  "
echo " |  _ < | |          | |    | |  "
echo " | |_) || |_   _     | |   _| |_ "
echo " |____/_____| (_)    |_|  |_____|"
echo "                        "
echo "enter target ip..."
read target_ip
nmap -Pn -sV -f -D RND:20 $target_ip
read -p "Enter the port version to search for exploits: " port_version


if ! command -v msfconsole &> /dev/null; then
    echo "Metasploit is not installed or not in PATH."
    exit 1
fi

echo "Starting msfconsole and searching for exploits for: $port_version"


msfconsole -q -x "search $port_version; "
 
