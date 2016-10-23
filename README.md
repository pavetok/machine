pavetok.machine
===============

Requirements
------------

    sudo ./packages.sh
    sudo ansible-galaxy install -r requirements.yml

Role Variables
--------------

See [defaults](defaults/main.yml).

Minimal Configuration
---------------------

    # hosts
    localhost ansible_connection=local

    # machine.yml
    - hosts: localhost
      roles:
        - role: pavetok.machine

Custom Configuration
--------------------

    # hosts
    localhost ansible_connection=local

    # machine.yml
    - hosts: localhost
      roles:
        - role: pavetok.machine
          machine_apps:
            virtualbox: yes
            vagrant: yes
            docker:
              engine: yes

Usage
-----

    ansible-playbook machine.yml -i hosts --ask-become-pass

Note
----

* hash_behaviour = merge

Dependencies
------------

See [here](requirements.yml).

License
-------

MIT
