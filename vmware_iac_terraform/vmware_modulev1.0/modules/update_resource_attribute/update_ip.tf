resource "null_resource" "update_resource_attribute" {
  connection {
    type = "ssh"
    host = var.ssh_host
    user = var.user
    #private_key = file(var.private_key_file_name)
    password = var.ssh_password
    #agent = false
  }
  provisioner "file" {
    source = var.provisioner_file_source
    destination = var.provisioner_file_destination
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod u+x ${var.provisioner_file_destination}",
      "sh ${var.provisioner_file_destination}",
    ]
  }
 # depends_on = var.dependent_resources
}