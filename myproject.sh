#!/bin/bash
#1. Display the linux version
#2. Display the private IP address, Public IP address, and the default gateway
#3. Display the hard disk size, free and used space
#4. Display the top five (5) directories and their size
#5. Display the CPU usage; refresh every 10 seconds

echo "My Linux Fundamental project"
echo "Jesupemiwale Adeniji"
echo "Question 1"
echo "________________________________________________"
echo "linux version" `uname -r`
echo""

echo "Question 2"
echo "________________________________________________"
echo "Display the private IP address, Public IP address, and the default gateway"

echo "Private IP Address" `curl ifconfig.me -s`

echo "Public IP Address" `ifconfig | grep broadcast | cut -d "," -f2`
echo "Default Gateway"  `route -n | grep UG | awk '{print $2}' | cut -d "," -f2`
echo""
	
		
echo "Question 3"
echo "_________________________________________________"
echo "Display the hard disk size, free and used space" `df -ht ext4`
echo""

echo "Question 4"
echo "____________________________________________________"
echo "Display the top five (5) directories and their size" `du -a| sort -n -r | head -n 5`
echo""

echo "Question 5"
echo "_____________________________________________________"

echo "Display the CPU usage; refresh every 10 seconds"
echo "-------------------------------CPU/Memory Usage------------------------------"
echo -e "Memory Usage:\t"`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
echo -e "Swap Usage:\t"`free | awk '/Swap/{printf("%.2f%"), $3/$2*100}'`
echo -e "CPU Usage:\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
echo ""


