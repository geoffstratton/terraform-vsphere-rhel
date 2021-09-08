vsphere_username = "[vcenter_username]"
vsphere_password = ""
vsphere_server = "my-vmware-cluster.com"
vsphere_datacenter = "MYDC"
vsphere_ds_cluster = "MYDC-DEV"
vsphere_datastore = "BIG-SAN"
vsphere_resource_pool = "host.my-vmware-cluster.com"

vm_vlan = "network-12345"
vm_template = "RHEL7"
vm_hostname = "rhel7"
vm_os = "rhel7_64Guest"
vm_cpus = 2
vm_mem = 4096
vm_env = "DEV"
vm_ip_addr = "192.168.0.20"
vm_ip_v4_gateway = "192.168.0.1"
vm_domain = ""
vm_dns_servers = ["8.8.8.8", "8.8.4.4"]
vm_dns_suffixes = ["google.com"]

ssh_username = "[provisioner]"
ssh_password = ""
artifactory = "https://jfrogbuild.com/"
ansible_supplement = "yum install --enablerepo=rhel* -y ansible-supplement-redhat && ansible-playbook -i /etc/ansible/hosts /usr/bin/run_role.sh -e run_role=ansible-supplement-redhat"
