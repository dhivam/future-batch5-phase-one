#!/bin/bash

# change directory 
cd /home/future/future5-phase-one/ansible

#generate ssh key 
ssh-keygen -t rsa -N '' -f /home/future/.ssh/id_rsa <<< y

#run ansible playbook to create and run all service
ansible-playbook -i hosts automation.yml --extra-vars "ansible_user=future ansible_password=batch5"
