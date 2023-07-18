# output "public_ip_arm_1" {
#   value = oci_core_instance.instance-1.public_ip
# }

output "public_ip_x86_1" {
  value = oci_core_instance.instance-2.public_ip
}

output "public_ip_x86_2" {
  value = oci_core_instance.instance-3.public_ip
}
