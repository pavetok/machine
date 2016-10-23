
CURRENT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
ROLES_DIR=/etc/ansible/roles
ROLE_NAME=pavetok.machine

.PHONY: ansible
ansible:
	sudo apt -y install libssl-dev python-pip
	sudo pip install -r requirements.txt
	ansible --version

.PHONY: clean
clean:
	sudo rm -rf ${ROLES_DIR}/*

.PHONY: link
link:
	sudo ln -sfT ${CURRENT_DIR} ${ROLES_DIR}/${ROLE_NAME}

.PHONY: install
install: link
	sudo ansible-galaxy install -r requirements.yml

.PHONY: lint
lint:
	ansible-lint --exclude=${ROLES_DIR} ${CURRENT_DIR} *.yml
