# variable "vars" {}
#  variable "ipv4_gateway" {} 
#  variable "dns" {}
#  variable "file_name" {}
#  variable "outputs" {}
#  variable "interface_name" {}

variable "modify_network" {
  type = object({
    ipv4_addr        = string,
    ipv4_gateway = string,
    dns = string,
    interface_name = string
  })
  description = "The network configuration values used in the modification of the Virtual Machine."
}
