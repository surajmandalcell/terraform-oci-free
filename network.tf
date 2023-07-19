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
  security_list_ids = [oci_core_security_list.security-list.id]
}

resource "oci_core_security_list" "security-list" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_virtual_network.vcn.id

  ingress_security_rules {
    protocol = "6"  # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6"  # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    protocol = "6"  # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
  }
}
