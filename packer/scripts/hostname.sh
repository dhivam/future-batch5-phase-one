#!/bin/bash

echo "add new hosts"
cat << EOT >> /etc/hosts
192.168.56.141 webserver1
192.168.56.142 webserver2
192.168.56.143 database1
192.168.56.144 database2
192.168.56.145 haproxy
192.168.56.146 ansible
EOT

echo "restart network"
systemctl restart NetworkManager