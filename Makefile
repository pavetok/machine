CURRENT_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
ROLES_DIR=/etc/ansible/roles
ROLE_NAME=pavetok.machine

ansible:
	sudo apt -y install \
	  libssl-dev \
	  python-pip \

	sudo pip install ansible

clean:
	sudo rm -rf ${ROLES_DIR}/*

link:
	sudo ln -sf ${CURRENT_DIR} ${ROLES_DIR}/${ROLE_NAME}

install:
	# https://github.com/ansible/ansible/issues/15413
	# tar -czf ${ROLE_NAME}.tar.gz *
	# sudo ansible-galaxy install ${ROLE_NAME}.tar.gz
	sudo ansible-galaxy install -r requirements.yml
	make link
