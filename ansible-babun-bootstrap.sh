#!/usr/bin/env zsh
ANSIBLE_DIR=$HOME/ansible

if [ -f /etc/ansible_init_babun.completed ]
  then
    echo "First init setting up Ansible in Babun has already been completed."
    echo "Performing Ansible update from source, if available."
    #Setup rebase Ansible
    cd $ANSIBLE_DIR
    git pull --rebase
    git submodule update --init --recursive
    source ./hacking/env-setup
    cd $HOME

    #Setup ENV_VARs for Ansible on Babun
    export ANSIBLE_SSH_ARGS='-o ControlMaster=no'
    export ANSIBLE_HOST_KEY_CHECKING=False

    echo "Remember to setup the ssh-agent."

  else
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
    mkdir -p $ANSIBLE_DIR
    git clone git://github.com/ansible/ansible.git --recursive $ANSIBLE_DIR
    cd $ANSIBLE_DIR
    source ./hacking/env-setup
    cd $HOME

    #Setup ENV_VARs for Ansible on Babun
    export ANSIBLE_SSH_ARGS='-o ControlMaster=no'
    export ANSIBLE_HOST_KEY_CHECKING=False


    #Set this script to run at Babun startup
    echo ". $HOME/ansible-babun-bootstrap/ansible-babun-bootstrap.sh" >> $HOME/.zshrc
    echo " "
    echo "Remember to setup the ssh-agent."
    echo " "
    echo "Please restart Babun!!!!"

    # touch a file to mark first app init completed
    touch /etc/ansible_init_babun.completed


fi
