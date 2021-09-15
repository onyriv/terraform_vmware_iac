data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}
data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  for_each      = toset(var.network_names)
  name          = each.value
  datacenter_id = data.vsphere_datacenter.dc.id

}
data "vsphere_virtual_machine" "template" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

module "vm" {
  source       = "./modules/create_vm"
  datastore_id = data.vsphere_datastore.datastore.id
  network_adapter_type = var.network_adapter_type
  resource_pool_id                = data.vsphere_compute_cluster.cluster.resource_pool_id
  template_disks_eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
  template_disks_thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  template_guest_id               = data.vsphere_virtual_machine.template.guest_id
  template_uuid                   = data.vsphere_virtual_machine.template.id
  template_scsi_type              = data.vsphere_virtual_machine.template.scsi_type
  vm_disk_label                   = var.vm_disk_label
  vm_name = var.vm_name[count.index]
  vm_template_disks_size = 2
  vmclone_dns_ip_address = var.vmclone_dns_ip_address
  vmclone_domain         = var.vmclone_domain
  vmclone_hostname       = var.vm_name[count.index]
  vmclone_ipv4_address   = var.vmclone_ipv4_address
  vmclone_ipv4_gateway   = var.vmclone_ipv4_gateway
  vmclone_ipv4_netmask   = var.vmclone_ipv4_netmask
  network_names          = data.vsphere_network.network
  network_config         = var.solution_config_vm_network_config[var.config_names[count.index]]
  resource_config        = var.solution_config_vm_resources[var.config_names[count.index]]
  count                  = length(var.vm_name)
}

# module "pass_variables_to_bash" {
#   source         = "./pass_variables_to_bash"
#   modify_network = var.modify_network
# }

# module "update_ip" {
#   source              = "./modules/update_resource_attribute"
#   dependent_resources = module.vm
#   # private_key_file_name = var.private_key_file_name
#   provisioner_file_destination = var.provisioner_file_destination
#   provisioner_file_source      = var.provisioner_file_source_ip
#   ssh_host                     = var.ssh_host
#   ssh_password                 = var.ssh_password
#   user                         = var.ssh_user
# }

# module "update_hostname" {
#   source              = "./modules/update_resource_attribute"
#   dependent_resources = module.vm
#   # private_key_file_name = var.private_key_file_name
#   provisioner_file_destination = var.provisioner_file_destination
#   provisioner_file_source      = var.provisioner_file_source_hostname
#   ssh_host                     = var.ssh_host
#   ssh_password                 = var.ssh_password
#   user                         = var.ssh_user
# }