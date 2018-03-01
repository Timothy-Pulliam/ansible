# ansible_named
Ansible playbook for configuring a BIND server on CentOS 7.4. This playbook installs named as well as bind-utils (like dig) for easier troubleshooting. It then uses a preconfigured /etc/named.conf template to create an authoritative DNS server. In other words, you can add DNS resource records to this server's zone files. The zone files are also added automatically in the named.conf file and created for you in /var/named/<zone_file>. The names of the zone files are determined from the variables set in the *dns.yaml* palybook. 

# How to Use
1) Clone this repository using git

`$ git clone https://github.com/Timothy-Pulliam/ansible_named.git`

`$ cd ansible_named`


2) Change the variables in the *dns.yaml* playbook. These will be used to configure the zones. For example, if you set zone to example.com, you will have a forward zone file located at */var/named/example.com.db*. I know there is a better way to do this and I may get around to it.

3) Run ansible the usual way

`$ ansible-playbook -i hosts dns.yaml` 
