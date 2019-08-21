resource "null_resource" "installation_wp" {
  triggers = {
    ids = "${azurerm_virtual_machine.azureblr_demo_vm.id}"
  }

  connection {
    host        = "${azurerm_public_ip.azureblr_demo_public_ip.ip_address}"
    user        = "${var.vm_username}"
    password    = "${var.vm_password}"
  }

  provisioner "remote-exec" {
    script = "./scripts/installation-wp.sh"
  }
}

resource "null_resource" "installation_mariadb" {
  depends_on = ["null_resource.installation_wp"]  

  triggers = {
    ids = "${azurerm_virtual_machine.azureblr_demo_vm.id}"
  }

  connection {
    host        = "${azurerm_public_ip.azureblr_demo_public_ip.ip_address}"
    user        = "${var.vm_username}"
    password    = "${var.vm_password}"
  }

  provisioner "remote-exec" {
    script = "./scripts/installation-mariadb.sh"
  }
}