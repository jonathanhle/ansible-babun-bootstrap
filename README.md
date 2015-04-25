# ansible-babun-bootstrap
Simple shell script to setup Ansible within Babun

1. Install Babun.
2. Place script in $HOME and run it:
. ./ansible-babun-bootstrap.sh

Be sure not to forget the extra ". ./" at the begining of the script, since we want to run the shell in the current environment.

Prereqs will be installed and Ansible will run from: /home/$USERNAME/ansible/
