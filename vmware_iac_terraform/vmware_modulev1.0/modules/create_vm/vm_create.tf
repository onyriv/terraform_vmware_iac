resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id

  num_cpus               = var.resource_config.vm_num_cpu
  cpu_hot_add_enabled    = "true"
  cpu_hot_remove_enabled = "true"
  memory                 = var.resource_config.vm_num_memory
  memory_hot_add_enabled = "true"

  guest_id = var.template_guest_id

  scsi_type = var.template_scsi_type


  dynamic "network_interface" {
    for_each = var.network_names
    content {
      network_id = network_interface.value.id
      adapter_type = var.network_adapter_type
    }
  }


  disk {
     eagerly_scrub    = "false"
     thin_provisioned = "false"
    label            = var.vm_disk_label
    size             = var.resource_config.vm_disk_size
  }
 

  clone {
    template_uuid = var.template_uuid

    customize {
      linux_options {
        host_name = var.vmclone_hostname
        domain    = var.vmclone_domain
      }

       dynamic "network_interface" {
        for_each = var.network_config
        content {
          ipv4_address = network_interface.value.ipv4_address
          ipv4_netmask = network_interface.value.ipv4_netmask
        }
      }


      ipv4_gateway = var.vmclone_ipv4_gateway
    }
  }

  wait_for_guest_net_timeout  = -1
  wait_for_guest_ip_timeout   = -1

  lifecycle {
    ignore_changes = [
      # Ignoring the clone block so we can still update the TF code but it won't destroy the instance.
      clone,
    ]
  }
}