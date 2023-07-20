resource "oci_core_virtual_network" "vcn" {
  cidr_block     = local.vcn_cidr_block
  display_name   = "AlwaysFreeVCN"
  compartment_id = local.compartment_id
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = local.compartment_id
  display_name   = "AlwaysFreeIGW"
  vcn_id         = oci_core_virtual_network.vcn.id
}

resource "oci_core_default_route_table" "default_route_table" {
  manage_default_resource_id = oci_core_virtual_network.vcn.default_route_table_id
  display_name               = "DefaultRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_core_subnet" "subnet" {
  availability_domain = local.availability_domain
  cidr_block          = local.subnet_cidr_block
  display_name        = "AlwaysFreeSubnet"
  vcn_id              = oci_core_virtual_network.vcn.id
  compartment_id      = local.compartment_id
  security_list_ids   = [oci_core_security_list.security-list-open.id]
  route_table_id      = oci_core_default_route_table.default_route_table.id # Use the updated default route table
}


resource "oci_core_security_list" "security-list-safe" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_virtual_network.vcn.id

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }

    stateless = false
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }

    stateless = false
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }

    stateless = false
  }
}

resource "oci_core_security_list" "security-list-open" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_virtual_network.vcn.id


  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
    stateless   = false
  }


  ingress_security_rules {
    protocol  = "all"
    source    = "0.0.0.0/0"
    stateless = false
  }


  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = false

    icmp_options {
      type = 3
      code = 4
    }
  }
}
