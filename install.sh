#!/bin/bash
# This script is used to check and see if Ansible is already installed.
# If it is already installed, nothing will occur and it will instead ask you to run the playbook.

###################
# Install Ansible #
###################
if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt-get update
    sudo apt-get install software-properties-common ansible git python3-apt -y

    # Check if installation was successful
    if [ $? -eq 0 ]; then
        echo "Installation completed and successful"
    else
        echo "Installation failed"
        exit 1
    fi
else
    echo "Ansible already installed"
fi

#####################################
# Display real installation process #
#####################################
echo ""
echo "Customize the playbook ansible-desktop.yml to suit your needs, then run ansible with :"
echo "  ansible-playbook ansible-desktop.yml --ask-become-pass"
echo "Optionally you can run just some of the tags like:"
echo "  ansible-playbook ansible-desktop.yml --ask-become-pass --tags=common,locales"
echo ""
echo ""
