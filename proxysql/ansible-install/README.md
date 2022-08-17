Ansible Role: ProxySQL
======================

ProxySQL role installs and configures ProxySQL from scratch to a Aurora-MySQL backend database.

Role Variables
--------------

The interface to variables in this role should only be via `inventories/{env}/group_vars/all.yml`, and it shouldn't be necessary to override the role vars.

Example Playbook
----------------

```
    - hosts: servers
      tasks:
        - import_role:
            name: proxysql
          tags:
            - proxysql
```

Example Playbook execution
--------------------------
```
ansible-playbook proxysql.yml -i inventories/{env}/hosts
```