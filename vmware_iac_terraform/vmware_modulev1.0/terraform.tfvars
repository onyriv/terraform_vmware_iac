user                 = "<enter vsphere username" 
password             = "<enter vsphere password>"
server               = "<enter vsphere ip address>"
allow_unverified_ssl = true
datacenter_name      = "<enter vsphere dc name>"
datastore_name       = "<enter vsphere datastore name>"
cluster_name         = "<enter vsphere cluster name>"
network_name         = "<enter vsphere network name>"
vm_template_name     = "test_centos"

vm_name      = ["terraform-test-02", "terraform-test-03"]
config_names = ["terraform_test_02", "terraform_test_03", "terraform_test_04"]
network_adapter_type   = "vmxnet3"
vm_disk_label          = "disk0"
vmclone_domain         = "test.internal"
vmclone_ipv4_gateway   = "10.98.124.254"
vmclone_ipv4_address   = ["10.98.124.14", "10.99.124.15"]
vmclone_dns_ip_address = "8.8.8.8"
vmclone_ipv4_netmask   = 24

ssh_host     = "10.98.124.14"
ssh_user     = "root"
ssh_password = "<enter template password>"

provisioner_file_destination     = "/tmp/script_8.sh"
provisioner_file_source_hostname = "update_hostname.sh"
provisioner_file_source_ip = "pass_variables_to_bash/update_ip_v3.sh"

network_names    = ["testeast-1001_1", "testeast-1002_1"]
vmclone_hostname = ["terraform-test-02", "terraform-test-03", "terraform-test-04"]
solution_config_vm_network_config = {
  terraform_test_02 = {
    public = {
      ipv4_address = "10.98.124.14"
      ipv4_netmask = 24
    },
    private = {
      ipv4_address = "10.98.124.15"
      ipv4_netmask = 24
    }
  },
  terraform_test_03 = {
    public = {
      ipv4_address = "10.98.124.16"
      ipv4_netmask = 24
    },
    private = {
      ipv4_address = "10.98.124.17"
      ipv4_netmask = 24
    }
  },
  terraform_test_04 = {
    public = {
      ipv4_address = "10.98.124.18"
      ipv4_netmask = 24
    },
    private = {
      ipv4_address = "10.98.124.19"
      ipv4_netmask = 24
    }
  }
}

solution_config_vm_resources = {
  terraform_test_02 = {
    vm_num_cpu    = 2
    vm_disk_size  = 2
    vm_num_memory = 1024
  },
  terraform_test_03 = {
    vm_num_cpu    = 1
    vm_disk_size  = 3
    vm_num_memory = 1024
  },
  terraform_test_04 = {
    vm_num_cpu    = 2
    vm_disk_size  = 4
    vm_num_memory = 1024
  }
}

modify_network = {
  ipv4_addr    = "10.98.124.21"
  ipv4_gateway = "10.98.124.254"
  dns          = "8.8.8.8"
  interface_name = "ens224"
}