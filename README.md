Repo Name
=========
terraform-vsphere-rhel

Description
---------------
Jenkins-driven, modularized Terraform builder for creating Red Hat 7 and 8 virtual machines from Packer templates named RHEL7 and RHEL8. In its original implementation, this was triggered by the https://github.com/geoffstratton/packer-vsphere-rhel job, but it works as a standalone Terraform builder. Note that the wrapper script uses a workplace switch to construct the two VMs independently.

* Terraform (https://www.terraform.io/)
* Terraform vSphere Provider (https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs)
* Packer (https://www.packer.io/)
* Packer vSphere-ISO builder (https://www.packer.io/docs/builders/vsphere)
* Jenkins (https://www.jenkins.io/)
* VMWare (https://www.vmware.com/)

License
-------
Apache 2.0

Author Information
------------------
Geoff Stratton
