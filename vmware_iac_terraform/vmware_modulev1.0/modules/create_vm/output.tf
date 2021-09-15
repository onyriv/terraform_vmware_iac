output "vm_ip_address" {
  value = vsphere_virtual_machine.vm.clone[0].customize[0].network_interface[0].ipv4_address
}

output "vm_hostname" {
  value = vsphere_virtual_machine.vm.clone[0].customize[0].linux_options[0].host_name
}