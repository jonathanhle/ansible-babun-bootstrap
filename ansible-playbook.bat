@echo off

REM This is the default Babun install location.
set CYGWIN=%USERPROFILE%\.babun\cygwin

REM This is the default Babun shell, changed to bash if you need to
set SH=%CYGWIN%\bin\zsh.exe

REM Setup a temp file where the default Vagrant private_key path is stored $HOME; if there's a previous entry in there, let's clear it
"%SH%" -c "cd $HOME && touch .babun_shim_vars && sed -i '/.*VAGRANT_PRIV_KEY_DIR.*/d' .babun_shim_vars"

REM Put the private_key path directory into the temp vars file we just setup: $HOME/.babun_shim_vars
"%SH%" -c "VAGRANT_PRIV_KEY_DIR=`echo %* | sed '0,\|C:/Users/%USERNAME%/.babun/cygwin| s|||' | awk '{print $1}' | sed '0,/--private-key=/ s///' | sed '0,/private_key/ s///'` && echo export VAGRANT_PRIV_KEY_DIRECTORY=$VAGRANT_PRIV_KEY_DIR >> $HOME/.babun_shim_vars"

REM Change directory to where the private key is stored and set permissions
"%SH%" -c "source $HOME/.babun_shim_vars && cd $VAGRANT_PRIV_KEY_DIRECTORY && setfacl -s user::r--,group::---,other::--- private_key"

REM Run the playbook commands, except change the private_key location to the Cygwin path, instead of using the Windows file location reference.
"%SH%" -c "$HOME/ansible/bin/ansible-playbook `echo %* | sed '0,\|C:/Users/%USERNAME%/.babun/cygwin/ s///'`"