data "template_file" "command" {
  template = file("C:/Users/Win 10 Lab/Documents/terraform/vmware_modulev14072021/pass_variables_to_bash/main.sh")
vars = var.modify_network
}

locals {
  output = data.template_file.command.rendered
}
# output "file" {
#   value = local.output
# }

resource "local_file" "update_ip_v3" {
    content     = <<-EOL
    ${data.template_file.command.rendered}
    EOL
    filename = "${path.module}/update_ip_v3.sh"
}
