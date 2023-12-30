#!/bin/bash
# This script is used to check and see if anisble is already installed. If it is already installed, nothing will occur and it will instead ask you to run the playbook.
###################
# Install ansible #
# if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
#     echo "Adding Ansible PPA"
#     sudo apt-add-repository ppa:ansible/ansible -y
# fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt-get update
    sudo apt-get install software-properties-common ansible git python3-apt -y
else
    echo "Ansible already installed"
fi

#####################################
# Display real installation process #
echo ""
echo "Customize the playbook ansible-desktop.yml to suit your needs, then run ansible with :"
echo "  ansible-playbook ansible-desktop.yml --ask-become-pass"
echo "Optionaly you can run just some of the tags like:"
echo "  ansible-playbook ansible-desktop.yml --ask-become-pass --tags=common,locales"
echo ""
echo ""
