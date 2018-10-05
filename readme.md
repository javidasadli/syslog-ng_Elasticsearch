syslog-ng and Elasticsearch 6: getting started on RHEL/CentOS.

This is a quick how-to guide to get you started with syslog-ng (the current version is 3.13) and Elasticsearch 6 on RHEL/CentOS 7. For more detailed information, see the syslog-ng documentation on sending log messages to Elasticsearch.
https://www.syslog-ng.com/technical-documents/doc/syslog-ng-open-source-edition/3.16/administration-guide




Installing applications.

As a first step, you have to enable a number of software repositories, and then install applications from them. These repositories contain Elasticsearch, the latest version of syslog-ng, and the dependencies of syslog-ng. These are all required for Elasticsearch 6 support.

./centos.server.sh 

1) Remove rsyslog packages and install syslog-ng service. 
2) Configure syslog-ng as shown in syslog_server.conf file.
3) Install elasticsearch and assign cluster name "syslog-ng".
4) Install Kibana and configure it for listening to 5601 port. 

syslog-ng.conf

This server configuration is relied on to accept logs in 514 udp port. Index will be created everyday depending on YEAR,MONTH,DAY. Template of logs is configured on ISODATE format and you can add whatever you want.

./ubuntu_client.sh

This is desinged for debian based syslog client configuration. This configuration is also removing rsyslog packages from system and then installing syslog-ng service. During the process it asks to enter syslog-ng server i