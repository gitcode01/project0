#!/bin/bash

LINE_RM="</strong></li>"

wget -q -O /tmp/vpnbook.tmp www.vpnbook.com/freevpn

printf "vpnbook\n" > ~/.vpn/login.txt
printf "$(cat /tmp/vpnbook.tmp | grep -m 1 Password | tr -s [:space:] ' ' | tr -d ' ')\n" >> ~/.vpn/login.txt
sed -i 's/<li>Password:<strong>//' ~/.vpn/login.txt
sed -i "s%$LINE_RM%%" ~/.vpn/login.txt

rm -f /tmp/vpnbook.tmp

openvpn ~/.vpn/vpnbook-de233-tcp443.ovpn
