# ansible-babun-bootstrap
Simple shell script to setup Ansible within Babun

1. Install Babun and start a terminal.
2. Clone repo into Babun $HOME:

- cd $HOME
- git clone https://github.com/jonathanhle/ansible-babun-bootstrap

3. Run the bootstrap script:


- cd ansible-babun-bootstrap
- . ./ansible-babun-bootstrap.sh

Be sure not to forget the extra ". ./" at the begining of the script, since we want to run the shell in the current environment.

Prereqs will be installed and Ansible will run from: /home/$USERNAME/ansible/
Bootstrap script will be added to .zshrc in $HOME.

You'll need to change the username in the ansible-playbook.bat to your username in the sed statements and/or adjust them to fit where Babun was installed.

    Please only use this shim with Vagrant for nonDev testing on Windows.  
    It's slows down Ansible a good bit and isn't representative of how quick Ansible can be.
