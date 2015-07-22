#!/usr/bin/env zsh

if [ ! -d ansible-babun-bootstrap ]
 then
  git clone https://github.com/tiangolo/ansible-babun-bootstrap.git
else
  cd ansible-babun-bootstrap
  git pull
  cd ..
fi

source ansible-babun-bootstrap/ansible-babun-bootstrap.sh