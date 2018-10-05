#!/bin/bash
# Installing syslog-ng 
yum erase -y rsyslog
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh epel-release-latest-7.noarch.rpm
cd /etc/yum.repos.d/
wget https://copr.fedorainfracloud.org/coprs/czanik/syslog-ng314/repo/epel-7/czanik-syslog-ng314-epel-7.repo
yum install -y syslog-ng 
yum install -y syslog-ng-java
systemctl enable syslog-ng 
cat syslog_server.conf > /etc/syslog-ng/conf.d/syslog_server.conf
systemctl start syslog-ng

# Installing Elasticsearch

cd /etc/yum.repos.d/
cat elastic.txt > /etc/yum.repos.d/elastic.repo
yum install -y elasticsearch
echo cluster.name: syslog-ng >> /etc/elasticsearch/elasticsearch.yml
systemctl enable elasticsearch
systemctl start elasticsearch

# If you only have a single Java version on your system, the commands below add the directory containing libjvm.so to the library path:
echo /usr/lib/jvm/jre/lib/amd64/server > /etc/ld.so.conf.d/java.conf
ldconfig

# Installing Kibana

yum install -y kibana
systemctl enable kibana
sed -i "5i server.port: 5601 " /etc/kibana/kibana.yml
sed -i "6i server.host: "0.0.0.0" " /etc/kibana.kibana.yml