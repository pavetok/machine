pavetok.machine
===============

Local machine configuration.

Requirements
------------

* ansible 2.1

Role Variables
--------------

See [defaults](defaults/main.yml).

Minimal Configuration
---------------------

    # inventory
    localhost ansible_connection=local

    # machine.yml
    - hosts: localhost
      roles:
        - role: pavetok.machine

Custom Configuration
--------------------

    # inventory
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

    ansible-playbook machine.yml -i inventory --ask-become-pass

Dependencies
------------

See [here](requirements.yml).

License
-------

MIT
