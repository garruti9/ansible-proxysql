Ansible Role: ProxySQL
======================

ProxySQL role to manage and configures dinamically ProxySQL Aurora-MySQL backend database.

Role Variables
--------------

The interface to variables in this role should be only managed when running a playbook. 


Operations Allowed
--------------

The idea is to execute particular tasks using tags from an ansible instance controller to be able manage different operations in ProxySQL

```
$ ansible-playbook manage_proxysql.yml --list-tags
playbook: manage_proxysql.yml
  play #1 (all): all	TAGS: []
      TASK TAGS: [add_proxysql_mysql_server, add_proxysql_user, delete_proxysql_mysql_server, delete_proxysql_user, modify_proxysql_variable, sync_proxysql_users]
```


Example Playbook
----------------

```
---
- hosts: all
  gather_facts: True
  remote_user: root
  roles:
    - manage_proxysql
```

Example Playbook execution for each operation
--------------------------

**add_proxysql_mysql_server:** Add a MySQL Server in ProxySQL. Parameters: dbserver
```
ansible-playbook manage_proxysql.yml -i inventories/{env}/hosts --tags add_proxysql_mysql_server -e dbserver=test
```

**delete_proxysql_mysql_server**: Delete a MySQL Server in ProxySQL. Parameters: dbserver
```
ansible-playbook manage_proxysql.yml -i inventories/{env}/hosts --tags delete_proxysql_mysql_server -e dbserver=test
```

**add_proxysql_user**: Add a MySQL user to ProxySQL. Parameters: username_to_add, password_to_add
```
ansible-playbook manage_proxysql.yml -i inventories/{env}/hosts --tags add_proxysql_user -e "username_to_add=test password_to_add=*D5A86E22E3978346627EC91D4D7A38EA52613BE1"
```

**delete_proxysql_user**: Delete a MySQL user to ProxySQL. Parameters: username_to_delete
```
ansible-playbook manage_proxysql.yml -i inventories/{env}/hosts --tags delete_proxysql_user -e username_to_delete=USERNAME
```

**sync_proxysql_users**: Syncs all users from a MySQL server in ProxySQL. Parameters: proxysql_database_writer_hostname,proxysql_mysql_port,database_username,database_password
```
ansible-playbook manage_proxysql.yml -i inventories/{env}/hosts --tags sync_proxysql_users -e "proxysql_database_writer_hostname=host proxysql_mysql_port=3306 database_username=test database_password=test"

```

**modify_proxysql_variable**: Modify a ProxySQL variable. Parameters:global_variables, global_variables_value
```
ansible-playbook manage_proxysql.yml -i inventories/dev/hosts --tags modify_proxysql_variable -e "global_variables=mysql-long_query_time global_variables_value=1100"
```
