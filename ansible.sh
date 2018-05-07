#!/usr/bin/env bash
#
# For updating tlp settings, run:
# sudo ./ansible.sh x1yoga.yml --tags tlp
#
# For remote provisioning, set up:
# /etc/ansible/hosts
# sudo env ANSIBLE_NOCOWS=1 ansible-playbook --skip-tags="hidpi,yoga,oled" x1remote.yml
# sudo env ANSIBLE_NOCOWS=1 ansible-playbook --tags="powertop" x1yoga.yml

SU=""
if [ "$(whoami)" != "root" ]; then
	SU="--ask-become-pass"
fi

env ANSIBLE_NOCOWS=1 ansible-playbook $SU $1 $2 $3 $4 $5 $6
