resource "oci_core_virtual_network" "vcn" {
  cidr_block     = local.vcn_cidr_block
  display_name   = "AlwaysFreeVCN"
  compartment_id = local.compartment_id
}

resource "oci_core_subnet" "subnet" {
  cidr_block          = local.subnet_cidr_block
  display_name        = "AlwaysFreeSubnet"
  vcn_id              = oci_core_virtual_network.vcn.id
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
}

resource "oci_core_volume" "block-volume-1" {
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
  size_in_gbs         = 50
}

# resource "oci_core_instance" "instance-1" {
#   availability_domain = local.availability_domain
#   compartment_id      = local.compartment_id
#   display_name        = local.instance_display_name
#   shape               = "VM.Standard.A1.Flex"

#   shape_config {
#     memory_in_gbs = 24
#     ocpus         = 4
#   }

#   create_vnic_details {
#     subnet_id        = oci_core_subnet.subnet.id
#     display_name     = "arm-vnic"
#     assign_public_ip = true
#     hostname_label   = "arm-free-tier"
#   }

#   source_details {
#     source_type = "image"
#     source_id   = local.source_id_arm
#     boot_volume_size_in_gbs = 50
#   }
# 
#    lifecycle {
#        prevent_destroy = true
#      }
# }

resource "oci_core_instance" "instance-2" {
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
  display_name        = local.instance_display_name
  shape               = "VM.Standard.E2.1.Micro"

  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    display_name     = "x86-vnic-1"
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = local.source_id_x86
    boot_volume_size_in_gbs = 50
  }
}

resource "oci_core_instance" "instance-3" {
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
  display_name        = local.instance_display_name
  shape               = "VM.Standard.E2.1.Micro"

  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    display_name     = "x86-vnic-2"
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = local.source_id_x86
    boot_volume_size_in_gbs = 50
  }
}
