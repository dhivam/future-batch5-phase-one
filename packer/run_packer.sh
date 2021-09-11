#!/bin/bash

hostname=("webserver1" "webserver2" "database1" "database2" "haproxy" )
ipAddr=("192.168.56.141" "192.168.56.142" "192.168.56.143" "192.168.56.144" "192.168.56.145")
ansible="ansible"
ipAnsible="192.168.56.146"
i=0

for vm in "${hostname[@]}"
do 
    sed -i "s/ip=${ipAddr[i-1]}/ip=${ipAddr[i]}/g" ./http/ks.cfg
    sed -i "s/hostname=${hostname[i-1]}/hostname=${hostname[i]}/g" ./http/ks.cfg
    packer build -var "vm_name=$vm" -var "output_directory=$vm" centos7.json 
    vboxmanage startvm "$vm" --type headless
    ((i=i+1))
done

    sed -i "s/ip=${ipAddr[4]}/ip=$ipAnsible/g" ./http/ks.cfg
    sed -i "s/hostname=${hostname[4}/hostname=$ansible/g" ./http/ks.cfg
    packer build -var "vm_name=$ansible" -var "output_directory=$ansible" ansible.json 
    vboxmanage startvm "$ansible" --type headless
