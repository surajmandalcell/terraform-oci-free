locals {
  config = var.toronto
  # config = var.hyderabad
  # config = var.example_zone
  # OCI
  tenancy_ocid        = local.config.tenancy_ocid
  user_ocid           = local.config.user_ocid
  api_key_fingerprint = local.config.api_key_fingerprint
  private_key_path    = local.config.private_key_path
  region              = local.config.region
  # Networking
  compartment_id      = local.config.compartment_id
  availability_domain = local.config.availability_domain
  vcn_cidr_block      = local.config.vcn_cidr_block
  subnet_cidr_block   = local.config.subnet_cidr_block
  # Instance
  instance_display_name = local.config.instance_display_name
  source_id_arm         = local.config.source_id_arm
  source_id_x86         = local.config.source_id_x86
}

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.4.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = local.tenancy_ocid
  user_ocid        = local.user_ocid
  fingerprint      = local.api_key_fingerprint
  private_key_path = local.private_key_path
  region           = local.region
}
