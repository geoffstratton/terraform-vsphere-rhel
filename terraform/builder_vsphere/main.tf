# ---------------------------------------------------------------------------------------------------------------------
# Locals
# ---------------------------------------------------------------------------------------------------------------------

locals {
  optionals = "var.supplement == 0 ? "#" : var.supplement"
}

# ---------------------------------------------------------------------------------------------------------------------
# VMWare Environment
# ---------------------------------------------------------------------------------------------------------------------

provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_username
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

#data "vsphere_network" "network" {
#  name          = var.vm_vlan
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

# ---------------------------------------------------------------------------------------------------------------------
# Virtual Machine Setup
# ---------------------------------------------------------------------------------------------------------------------

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_custom_attribute" "build_tag" {
  name = "built_by"
}

data "vsphere_custom_attribute" "destroy_tag" {
  name = "destroy"
}

resource "vsphere_virtual_machine" "vm" {
  name		   = var.vm_hostname
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.vm_cpus 
  memory   = var.vm_mem
  guest_id = var.vm_os 

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = var.vm_vlan
    adapter_type = "vmxnet3"
  }

  disk {
    label             = "${var.vm_hostname}.vmdk" 
    size              = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub     = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned  = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  // If you need another disk, be sure to assign a unit_number
  #disk {
  #  unit_number      = 1
  #  label            = "${var.vm_hostname}1.vmdk"
  #  size             = data.vsphere_virtual_machine.template.disks.1.size
  #  eagerly_scrub    = data.vsphere_virtual_machine.template.disks.1.eagerly_scrub
  #  thin_provisioned = data.vsphere_virtual_machine.template.disks.1.thin_provisioned
  #}

  custom_attributes = map(data.vsphere_custom_attribute.build_tag.id, "sre-terraform", data.vsphere_custom_attribute.destroy_tag.id, "sre-dd-vmware-guest")

  clone {

    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      network_interface {
        ipv4_address = var.vm_ip_addr 
        ipv4_netmask = 24
      }
       
      linux_options {
        host_name = var.vm_hostname 
        domain    = var.vm_domain
      }

      ipv4_gateway    = var.vm_ip_v4_gateway 
      dns_server_list = var.vm_dns_servers
      dns_suffix_list = var.vm_dns_suffixes 
    }
  }
  
  //
  // Establish an SSH connection
  // 
  connection {
    type        = "ssh"
    host        = var.vm_ip_addr 
    user        = var.ssh_username
    password    = var.ssh_password
    port        = var.ssh_port
    script_path = "/tmp/provision.sh"
  }

  //
  // Do our bootstrapping
  //
  provisioner "remote-exec" {
     inline = [
       "cat /etc/redhat-release",
       "echo '${var.vm_hostname}:${var.vm_env}:TERRAFORM:Terraform POC (INT):version 0.1:x:Linux Platform Engineering::INT:SRE Linux Team' > /tmp/build_info",
       "sudo mv /tmp/build_info /.",
       "sudo chmod 0644 /build_info",
       "sudo chown root:root /build_info",
     ]
  }  
  #provisioner "file" {
  #  source      = "scripts/terraform_boot.sh"
  #  destination = "/tmp/terraform_boot.sh"
  #}

  #provisioner "remote-exec" {
  #  inline = [
  #    "sudo sh /tmp/terraform_boot.sh",
  #  ]
  #}
}
