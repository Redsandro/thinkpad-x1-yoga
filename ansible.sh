#!/usr/bin/env bash

# sudo ./ansible.sh lenovo.yml --tags firefox

SU=""
if [ "$(whoami)" != "root" ]; then
	SU="--ask-become-pass"
fi

env ANSIBLE_NOCOWS=1 ansible-playbook $SU $1 $2 $3 $4 $5 $6
