// vSphere setup
variable "vsphere_username" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "vsphere_datacenter" {}
variable "vsphere_ds_cluster" {}
variable "vsphere_datastore" {}
variable "vsphere_resource_pool" {}

// VM setup
variable "vm_cpus" {}
variable "vm_mem" {}
variable "vm_env" {}
variable "vm_domain" {}
variable "vm_dns_servers" {}
variable "vm_dns_suffixes" {}
variable "vm_vlan" {}
variable "vm_template" {}
variable "vm_hostname" {} 
variable "vm_os" {}
variable "vm_ip_addr" {}
variable "vm_ip_v4_gateway" {}

// Provisioning setup
variable "ssh_username" {}
variable "ssh_password" {}
variable "artifactory" {}
variable "supplement" {}

