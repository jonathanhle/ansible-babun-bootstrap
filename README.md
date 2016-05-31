# ansible-babun-bootstrap

## Description

Simple shell script to setup [Ansible](http://www.ansible.com/) within [Babun](http://babun.github.io/), to allow using Ansible from Windows without needing a virtual machine.

**I'm not longer maintaining this repo, since I've switch over to using Ansible directly on Linux.  Head over to https://github.com/tiangolo/ansible-babun-bootstrap who has a great fork.**

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

A file ~/.ansible.cfg will be created with default configurations, including setting paramiko as the transport to allow
using passwords.

A bootstrap script will be added to .zshrc in $HOME, every time you start babun it will update Ansible and setup the
environment. If you don't want to update Ansible every time (it takes some time), you can edit ~/.zshrc and set
BOOTSTRAP_ANSIBLE_UPDATE=0.
