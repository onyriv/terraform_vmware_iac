#!/bin/bash
# modify ip address, gateway & dns
sudo nmcli connection modify "${interface_name}" IPv4.address ${ipv4_addr}
sudo nmcli connection modify "${interface_name}" IPv4.gateway ${ipv4_gateway}
sudo nmcli connection modify "${interface_name}" IPv4.dns ${dns}
sudo nmcli connection modify "${interface_name}" IPv4.method manual
sudo nmcli connection down "${interface_name}" && sudo nmcli connection up "${interface_name}"
#sudo nmcli connection down ${interface_name} && sudo nmcli connection up ${interface_name}