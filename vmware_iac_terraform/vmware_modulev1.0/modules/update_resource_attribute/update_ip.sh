#!/bin/bash
sudo nmcli connection modify ens192 IPv4.address 10.10.10.102/24
#sudo nmcli connection modify enp1s0 IPv4.address 192.168.122.66/24
sudo nmcli connection modify ens192 IPv4.gateway 10.10.10.1
sudo nmcli connection modify ens192 IPv4.dns 8.8.8.8
sudo nmcli connection modify ens192 IPv4.method manual
sudo nmcli connection down ens192 && sudo nmcli connection up ens192
