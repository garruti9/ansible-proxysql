apt-get update
apt-get install git
pip install --upgrade pip
pip3 install ansible
mkdir -p /etc/ansible/
mkdir -p /usr/local/etc/ansible/
cd /usr/local/etc/ansible/
git clone https://github.com/garruti9/ansible-proxysql.git
cd ansible-proxysql

ansible-playbook proxysql.yml -i inventories/dev/hosts

