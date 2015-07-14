# ansible-babun-bootstrap

## Description

Simple shell script to setup [Ansible](http://www.ansible.com/) within [Babun](http://babun.github.io/).

## Installation

* Install [Babun](http://babun.github.io/) and start a terminal.
* Run the following command:

```
curl -s https://raw.githubusercontent.com/tiangolo/ansible-babun-bootstrap/master/install.sh | source /dev/stdin
```

Note: the previous command will get a script from this repository and run it immediately, performing all the needed
steps to install everything (the same steps described in "Manual installation").
If you don't want to run it, you can do a manual installation.

-----

## Manual installation

* Go to your home directory:

```
cd
```

* Clone this repository:

```
git clone https://github.com/tiangolo/ansible-babun-bootstrap
```

* Enter the repository directory:

```
cd ansible-babun-bootstrap
```

* Run the bootstrap script:

```
source ./ansible-babun-bootstrap.sh
```

All the prerequisites will be installed and Ansible will run from: $HOME/ansible/.
A file /etc/ansible/hosts will be created with a default (127.0.0.1) host.
A file ~/.ansible.cfg
Bootstrap script will be added to .zshrc in $HOME.

You'll need to change the username in the ansible-playbook.bat to your username in the sed statements and/or adjust them to fit where Babun was installed.

    Please only use this shim with Vagrant for nonDev testing on Windows.  
    It's slows down Ansible a good bit and isn't representative of how quick Ansible can be.
