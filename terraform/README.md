Role Name
=========
terraform-vsphere-rhel

Description
---------------
Jenkins-driven Terraform module to build Red Hat 7 and 8 VMs in a VMware vSphere environment. Uses local VM templates as the image source and performs assorted cleanup and post-processing. 

* Packer (https://www.packer.io/)
* Packer vSphere-ISO builder (https://www.packer.io/docs/builders/vmware/vsphere-iso)
* Jenkins (https://www.jenkins.io/)
* Terraform (https://www.terraform.io/)
* VMWare (https://www.vmware.com/)

License
-------
Apache 2.0

Author Information
------------------
Geoff Stratton

Passing Variables
-----------------
Either place your variables in a "terraform.tfvars" file at the top level, like this:

```bash
vsphere_username = ""
vsphere_password = ""
vsphere_server = ""
ssh_username = ""
ssh_password = ""
vsphere_vlan = "vlandev"
vm_template = "RHEL7"
vm_hostname = "rhel7"
vm_os = "rhel7_64Guest"
vm_ip_addr = "192.168.0.20"
vm_ip_v4_gateway = "192.168.0.1"
``` 

-or-

Specify variables on the command line, like this: 

```bash
terraform plan -out="plans/myplan.out" -var vm_hostname="rhel8" -var "vm_os=rhel8_64Guest" -var "supplement=1"
```

-or- 

Put your variables in a variables.tf file.

Much like Ansible, Terraform observes an order of precedence for its variables:

1) Variables set on the command line with the -var or -var-file flags
2) Variables set in the terraform.tfvars file
3) Variables set in \*.auto.tfvars files
4) Variables defined in a .tf file in the same directory

So, `-var="vm_os=rhel8_64Guest"` will override any vm_os setting in terraform.tfvars, which will override any vm_os variable set in the variables.tf file in your working directory.

Note that variables still need to be *declared* at every level in your directory structure.
