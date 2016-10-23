
CURRENT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
ROLES_DIR=/etc/ansible/roles
ROLE_NAME=pavetok.machine

ansible:
	sudo apt -y install \
	  libssl-dev \
	  python-pip
	sudo pip install -r requirements.txt
  ansible --version

clean:
	sudo rm -rf ${ROLES_DIR}/*

link:
	sudo ln -sfT ${CURRENT_DIR} ${ROLES_DIR}/${ROLE_NAME}

install: link
	# https://github.com/ansible/ansible/issues/15413
	# tar -czf ${ROLE_NAME}.tar.gz *
	# sudo ansible-galaxy install ${ROLE_NAME}.tar.gz
	sudo ansible-galaxy install -r requirements.yml

lint:
	ansible-lint --exclude=${ROLES_DIR} ${CURRENT_DIR} *.yml
