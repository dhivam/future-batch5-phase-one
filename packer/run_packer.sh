#!/bin/bash

# node 
hostname=("webserver1" "webserver2" "database1" "database2" "haproxy")
ipAddr=("192.168.56.141" "192.168.56.142" "192.168.56.143" "192.168.56.144" "192.168.56.145")

# ansible server
ansible="ansible"
ipAnsible="192.168.56.146"
i=0

# Build VirtualBox machine images for node
for vm in "${hostname[@]}"
do  
    ((i=i+1))
    sed -i "s/ip=${ipAddr[i-1]}/ip=${ipAddr[i]}/g" ./http/ks.cfg
    packer build -var "vm_name=$vm" -var "output_directory=$vm" centos7.json 

# Start the VirtualBox machine images for node
    vboxmanage startvm "$vm" --type headless
done

# Build VirtualBox machine images for ansible
sed -i "s/ip=${ipAddr[4]}/ip=$ipAnsible/g" ./http/ks.cfg
packer build -var "vm_name=$ansible" -var "output_directory=$ansible" ansible.json 

# Start the VirtualBox machine images for ansible
vboxmanage startvm "$ansible" --type headless



