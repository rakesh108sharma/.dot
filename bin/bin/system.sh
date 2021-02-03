#!/bin/bash
#
# ! autostart.sh !
# quick and dirty system check for:
#    - daemons
#    - jails
#    - network
#    - firewall

##### BEGIN

# daemons
doas vsv
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
echo
ip r
echo
read -p "          press <ENTER>"
clear

echo "          Network PING..."
[ "$(ping -c 1 facebook.com)" ] && echo "   network OK!" || echo "   !internet not reachable!"
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
doas iptables -L -v
read -p "          press <ENTER>"
clear

# check if transmission is set to "maya:maya"
grep maya /etc/sv/transmission-daemon/run >/dev/null 2>&1 || echo "transmission needs to be repaired!"
echo

# calendar
echo
when
echo
task list due.not:someday
read -p "          press <ENTER>"

# THE END
echo
echo

echo "...done!"
echo
echo

exit 0

##### END
