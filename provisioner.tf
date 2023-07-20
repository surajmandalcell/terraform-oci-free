# resource "null_resource" "remote-exec" {
#   # count      = 3
#   depends_on = [oci_core_instance.instance-1,oci_core_instance.instance-2, oci_core_instance.instance-3]

#   provisioner "remote-exec" {
#     connection {
#       agent = false
#       type  = "ssh"
#       host        = "oci_core_instance.instance-${count.index}.public_ip"
#       user        = "ubuntu"
#       private_key = file(local.private_key_path)
#       timeout     = "3m"
#       password    = local.default_password
#       script_path = local.script_1
#     }

#     inline = [
#       "echo Inside the x86 instance 1",
#       "echo 'Username: $(whoami)'",
#       "echo 'IP Address: $(curl -s http://ifconfig.net)'",
#       "echo 'Hostname: $(hostname)'",
#     ]
#   }
# }

resource "null_resource" "ssh_config" {
  depends_on = [oci_core_instance.instance-1, oci_core_instance.instance-2, oci_core_instance.instance-3]

  provisioner "local-exec" {
    command     = "chmod +x local.sh && ./local.sh"
    working_dir = path.module
  }
}
