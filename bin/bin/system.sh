#!/bin/bash
#
# quick and dirty system check for:
#    - daemons
#    - jails
#    - network
#    - firewall

# daemons
sudo vsv 
read -p "          press <ENTER>"
clear

# scron 
echo "          CRONTAB"
echo
cat /etc/crontab
read -p "          press <ENTER>"
clear

# network
ip a
echo
read -p "          press <ENTER>"
clear

echo "          Network PING..."
[ "$(ping -c 3 facebook.com)" ] && echo "   network OK!" || echo "   !internet not reachable!"
sleep 1
echo

echo "          RESOLV.CONF"
cat /etc/resolv.conf
echo

echo "          NMAP"
nmap 192.168.1.22 | grep open
echo

echo "          NETSTAT"
netstat -ltn4
read -p "          press <ENTER>"
clear

# firewall
echo "          FIREWALL"
sudo iptables -L -v
read -p "          press <ENTER>"
clear

# THE END
echo "...done!"

exit 0

