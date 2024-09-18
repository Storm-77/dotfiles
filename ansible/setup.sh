#!/bin/bash

ansible-galaxy install -r requirements.yaml && ansible-playbook --ask-become-pass ~/.dotfiles/ansible/setup.yaml
