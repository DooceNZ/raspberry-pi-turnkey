#!/bin/bash

systemctl disable dnsmasq
systemctl stop dnsmasq

nmcli con delete WATNEY-AP
nmcli con add type wifi ifname wlan0 mode ap con-name WATNEY-AP ssid Watney autoconnect false
nmcli con modify WATNEY-AP wifi.band bg
nmcli con modify WATNEY-AP wifi.channel 7
nmcli con modify WATNEY-AP ipv4.method shared ipv4.address 192.168.4.1/24
nmcli con modify WATNEY-AP ipv6.method disabled
nmcli con up WATNEY-AP
