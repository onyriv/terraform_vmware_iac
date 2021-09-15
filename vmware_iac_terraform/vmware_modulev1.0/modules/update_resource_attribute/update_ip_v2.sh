#!/bin/bash
file_name="network_interface.txt"
outputs="outputs.txt"
#execute command to list interfaces
network_interface_command="/sbin/ip -6 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1 | grep -e 'ens'"
network_interface=$(eval "$network_interface_command")

#write interfaces to a file
IFS=$'\n'
echo "$network_interface" | awk "{print $1}" > "${file_name}"
unset IFS

#loop through the network inteface file, extract the interface names and saves it to a file
array_val=()
rm "${outputs}" 2> /dev/null ||true
while read network_interface; do
    array_val=($network_interface);
    echo "$array_val" | awk "{print $1}" >> "${outputs}"
done <<< `cat "${file_name}"`


#creates an array from the output file
mapfile -t final_string < "${outputs}"

# modify ip address, gateway & dns
sudo nmcli connection modify "${final_string[0]}" IPv4.address 10.10.10.102/24
sudo nmcli connection modify "${final_string[0]}" IPv4.gateway 10.10.10.1
sudo nmcli connection modify "${final_string[0]}" IPv4.dns 8.8.8.8
sudo nmcli connection modify "${final_string[0]}" IPv4.method manual
sudo nmcli connection down "${final_string[0]}" && sudo nmcli connection up "${final_string[0]}"
