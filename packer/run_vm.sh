#!/bin/bash

# node 
vmNode=("web1" "web2" "db1" "db2" "lb")
ipNode=("192.168.56.141" "192.168.56.142" "192.168.56.143" "192.168.56.144" "192.168.56.145")

# ansible server
vmAnsible="ansible"
ipAnsible="192.168.56.146"
i=0

# Build VirtualBox machine images for node
for n in "${vmname[@]}"
do 
    sed -i "s/ip=${ip[i-1]}/ip=${ipNode[i]}/g" ./http/ks.cfg
    packer build -var "vm_name=$n" -var "output_directory=$n" centos7.json 

# Start the VirtualBox machine images for node
    vboxmanage startvm "$n" --type headless
    ((i=i+1))
done

# Build VirtualBox machine images for ansible
sed -i "s/ip=${ip[5]}/ip=$ipAnsible/g" ./http/ks.cfg
packer build -var "vm_name=$vmAnsible" -var "output_directory=$vmAnsible" ansible.json 

# Start the VirtualBox machine images for ansible
vboxmanage startvm "$vmAnsible" --type headless



