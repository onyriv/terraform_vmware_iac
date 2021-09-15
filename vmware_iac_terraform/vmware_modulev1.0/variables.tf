variable "user" {}
variable "password" {}
variable "server" {}
variable "allow_unverified_ssl" {}
variable "datacenter_name" {}
variable "datastore_name" {}
variable "cluster_name" {}
variable "network_name" {}
variable "vm_template_name" {}
variable "vm_name" {}
variable "network_adapter_type" {}
variable "vm_disk_label" {}
variable "vmclone_hostname" {}
variable "vmclone_domain" {}
variable "vmclone_ipv4_address" {}
variable "vmclone_ipv4_netmask" {}
variable "vmclone_dns_ip_address" {}
variable "vmclone_ipv4_gateway" {}
variable "ssh_host" {}
variable "ssh_user" {}
variable "ssh_password" {}
variable "config_names" {}
variable "provisioner_file_destination" {}
variable "provisioner_file_source_hostname" {}
variable "provisioner_file_source_ip" {}

variable "network_names" {}
variable "solution_config_vm_network_config" {
  type = any
}

variable "solution_config_vm_resources" {
  type = any
}
variable "modify_network" {}
