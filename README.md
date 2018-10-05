<p><strong>syslog-ng and Elasticsearch 6: getting started on RHEL/CentOS.</strong></p>
<p>This is a quick how-to guide to get you started with syslog-ng (the current version is 3.13) and Elasticsearch 6 on RHEL/CentOS 7. For more detailed information, see the syslog-ng documentation on sending log messages to Elasticsearch. https://www.syslog-ng.com/technical-documents/doc/syslog-ng-open-source-edition/3.16/administration-guide</p>
<p>&nbsp;</p>
<p><strong>Installing applications.</strong></p>
<p>&nbsp;As a first step, you have to enable a number of software repositories, and then install applications from them. These repositories contain Elasticsearch, the latest version of syslog-ng, and the dependencies of syslog-ng. These are all required for Elasticsearch 6 support.</p>
<p>&nbsp;</p>
<p><strong>./centos.server.sh</strong></p>
<ul>
<li>&nbsp;&nbsp;&nbsp; Remove rsyslog packages and install syslog-ng service.</li>
<li>&nbsp;&nbsp;&nbsp; Configure syslog-ng as shown in syslog_server.conf file.</li>
<li>&nbsp;&nbsp;&nbsp; Install elasticsearch and assign cluster name "syslog-ng".</li>
<li>&nbsp;&nbsp;&nbsp; Install Kibana and configure it for listening to 5601 port.</li>
</ul>
<p>&nbsp;</p>
<p><strong>syslog-ng.conf</strong></p>
<p>This server configuration is relied on to accept logs in 514 udp port. Index will be created everyday depending on YEAR,MONTH,DAY. Template of logs is configured on ISODATE format and you can add whatever you want.</p>
<p><strong>&nbsp;</strong></p>
<p><strong>./ubuntu_client.sh</strong></p>
<p>&nbsp;</p>
<p>This is desinged for debian based syslog client configuration. This configuration is also removing rsyslog packages from system and then installing syslog-ng service. During the process it asks to enter valid syslog-ng server ip address.</p>
