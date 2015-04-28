# ansible-babun-bootstrap
Simple shell script to setup Ansible within Babun

1. Install Babun and start a terminal.
2. Clone repo into Babun $HOME:

   cd $HOME
   git clone https://github.com/jonathanhle/ansible-babun-bootstrap
3. Run the bootstrap script:

   cd ansible-babun-bootstrap
   . ./ansible-babun-bootstrap.sh

Be sure not to forget the extra ". ./" at the begining of the script, since we want to run the shell in the current environment.

Prereqs will be installed and Ansible will run from: /home/$USERNAME/ansible/
Bootstrap script will be added to .zshrc in $HOME.
