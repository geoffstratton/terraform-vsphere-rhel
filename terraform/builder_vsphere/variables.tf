# ---------------------------------------------------------------------
# Terraform backend config
# ---------------------------------------------------------------------

# ---------------------------------------------------------------------
# VMWare environment mappings
# ---------------------------------------------------------------------

variable "vsphere_username" {
  default = "" 
}

variable "vsphere_password" {
  default = ""
}

variable "vsphere_server" {
  default = ""
}

variable "vsphere_datacenter" {
  default     = ""
}

#variable "vsphere_datastore_cluster" {
#  description = "vSphere storage cluster"
#  default = ""
#}

variable "vsphere_datastore" {
  description = "vSphere storage cluster"
  default     = ""
}

variable "vsphere_resource_pool" {
  description = "vSphere compute cluster"
  default     = ""
}

variable "vm_vlan" {
  description = "The network to use"
  default     = ""
}

# ---------------------------------------------------------------------
# The VM guest
# ---------------------------------------------------------------------
variable "vm_template" {
  description = "The template for the build"
  default     = "" 
} 

variable "vm_hostname" {
  description = "A machine name"
  default     = ""
}

variable "vm_cpus" {
  description = "Virtual CPUs"
  default = 2
}

variable "vm_mem" {
  description = "Virtual RAM"
  default = 4096
}

variable "vm_os" {
  description = "The server image, in VMWare"
  default = ""
}

variable "vm_env" {
  description = "The machine environment"
  default     = ""
}

variable "vm_domain" {
  description = "The domain to join"
  default     = ""
}

variable "vm_ip_addr" {
  description = "Location of our test server"
  default     = ""
}

variable "vm_ip_v4_gateway" {
  description = "IPv4 gateway"
  default     = ""
}

variable "vm_dns_servers" {
  description = "DNS servers"
  default     = ""
}

variable "vm_dns_suffixes" {
  description = "Resolvers"
  default     = ""
}

# ---------------------------------------------------------------------
# Provisioning variables
# ---------------------------------------------------------------------
variable "ssh_username" {
  default = ""
}

variable "ssh_password" {
  default = ""
}

variable "ssh_port" {
  default = 22
}

variable "artifactory" {
  description = "Artifactory repo"
  default = ""
}

variable "supplement" {
  description = "The supplemental software role"
  default = ""
}
