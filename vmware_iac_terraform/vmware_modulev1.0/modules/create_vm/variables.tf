variable "resource_pool_id" {}
variable "datastore_id" {}
variable "template_guest_id" {}
variable "template_scsi_type" {}
variable "vm_name" {}
variable "network_names" {}
variable "network_config" {}
variable "resource_config" {}
variable "network_adapter_type" {}
variable "vm_disk_label" {}
variable "vm_template_disks_size" {}
variable "template_disks_eagerly_scrub" {}
variable "template_disks_thin_provisioned" {}
variable "template_uuid" {}
variable "vmclone_hostname" {
    type = any
}
variable "vmclone_domain" {}
variable "vmclone_ipv4_address" {
    type = any
}
variable "vmclone_ipv4_netmask" {}
variable "vmclone_dns_ip_address" {}
variable "vmclone_ipv4_gateway" {}

