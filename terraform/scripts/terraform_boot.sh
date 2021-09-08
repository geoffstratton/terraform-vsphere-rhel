#!/bin/sh
yum remove -y katello*
echo "$VM_HOSTNAME:$VM_ENV:TERRAFORM:Terraform POC (INT):version 0.1:x:Geoff Stratton::INT:Linux Team" > /build_id
wget --no-check-certificate https://satellite-server.com/pub/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh > /var/log/bootstrapped.log
yum install --enablerepo=ansible-repo -y ansible-supplment-redhat && ansible-playbook -i /etc/ansible/hosts /usr/bin/run_role.sh -e run_role=dd-ansible-supplement-redhat
