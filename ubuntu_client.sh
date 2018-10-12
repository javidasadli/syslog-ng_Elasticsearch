#!/bin/bash
systemctl stop rsyslog
systemctl disable rsyslog
apt-get autoremove rsyslog -y 
apt-get install syslog-ng -y 
systemctl enable syslog-ng 
echo "Please enter your valid syslog-server IP address!"
read serverip
sed -i "35i destination d_net { udp(“$serverip” port(514) log_fifo_size(1000)); };" /etc/syslog-ng/syslog-ng.conf 
sed -i "25i ForwardToSyslog=yes" /etc/systemd/journald.conf 
systemctl restart systemd-journald.service 
systemctl restart syslog-ng
