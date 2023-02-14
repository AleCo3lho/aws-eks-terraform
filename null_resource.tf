resource "null_resource" "export_kubeconfig" {

  provisioner "local-exec" {

    command = "/bin/bash script.sh"
  }
  depends_on = [
    module.master,
    module.node
  ]
}