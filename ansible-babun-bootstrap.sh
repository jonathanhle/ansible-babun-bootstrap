#!/usr/bin/env zsh

#Replace babun sudo with new fake sudo for Ansible, throwing way all sudo args.
echo "#!/usr/bin/env bash" > /usr/bin/sudo
echo "count=0" >> /usr/bin/sudo
echo "for var in "$@"" >> /usr/bin/sudo
echo "  do" >> /usr/bin/sudo
echo "    (( count++ ))" >> /usr/bin/sudo
echo "  done" >> /usr/bin/sudo
echo "shift $count" >> /usr/bin/sudo
echo "exec "$@"" >> /usr/bin/sudo

#Install Ansible Prereqs
pact install python
pact install python-paramiko
pact install python-crypto
pact install gcc-g++
pact install wget
pact install openssh
pact install python-setuptools
pact install libyaml-devel
easy_install pip
pip install PyYAML Jinja2 httplib2 boto awscli

#Create initial Ansible hosts inventory
mkdir -p /etc/ansible/
echo "127.0.0.1" > /etc/ansible/hosts
chmod -x /etc/ansible/hosts

#Setup Ansible from Source
git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible
source ./hacking/env-setup

#Setup ENV_VARs for Ansible on Babun
export ANSIBLE_SSH_ARGS='-o ControlMaster=no'
export ANSIBLE_HOST_KEY_CHECKING=False
