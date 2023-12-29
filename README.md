# ansible_raspberry_pi
Ansible playbook for setting up a new raspberry pi. I use this for when I want to deploy a new raspberry pi, or replace one after it has been re-imaged. This is heavily inspired/taken directly from

## Requirements
- Git
- Ansible 2+ (automatically installed from [Ansible offical PPA](https://launchpad.net/~ansible/+archive/ubuntu/ansible) with the provided install.sh script)


## Installation
First, you need to install Git and Ansible :
```
$ sudo apt-get install git
$ git clone https://github.com/W00glin/ansible_raspberry_pi.git
$ cd ansible_raspberry_pi
$ bash ./install.sh
```

Then you need to copy the `group_vars/all.yml` to `group_vars/local.yml` and customize the which role you need suits your needs. All roles are disabled by default. To customize the install, simply enable any of the boolean options in the  `all.yml` file. 

Run `ansible-playbook ansible-raspberry-pi.yml --ask-become-pass` and enter your sudo password to run the playbook

Optionaly you can run just some of the tags like:
`ansible-playbook ansible-raspberry-pi.yml --ask-become-pass --tags=common,locales`

Tags are named the same as role dirs. If a role is in a sub dir then the tag for that specific role is sepparated with a colon like: `aws:cli`. But you can also use `aws` and that should install all the roles under the `aws` dir.