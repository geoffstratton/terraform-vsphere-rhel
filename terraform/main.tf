module "build_virtual_server" {
  source = "./builder_vsphere"

  vsphere_server = var.vsphere_server
  vsphere_username = var.vsphere_username
  vsphere_password = var.vsphere_password
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password

  vsphere_datacenter 	    = var.vsphere_datacenter
  vsphere_datastore 	    = var.vsphere_datastore
  vsphere_resource_pool     = var.vsphere_resource_pool

  vm_vlan 		    = var.vm_vlan
  vm_template 		    = var.vm_template
  vm_hostname 		    = var.vm_hostname
  vm_cpus		    = var.vm_cpus
  vm_mem		    = var.vm_mem
  vm_os	    		    = var.vm_os
  vm_env 		    = var.vm_env
  vm_domain 		    = var.vm_domain
  vm_ip_addr 		    = var.vm_ip_addr
  vm_ip_v4_gateway	    = var.vm_ip_v4_gateway
  vm_dns_servers            = var.vm_dns_servers
  vm_dns_suffixes           = var.vm_dns_suffixes
  
  artifactory		    = var.artifactory
  supplement			    = var.ansible-supplement-redhat
}
