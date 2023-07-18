variable "example_zone" {
  type = any
  default = {
    tenancy_ocid = ""
    user_ocid = ""
    api_key_fingerprint = ""
    private_key_path = ""
    region = ""
    compartment_id = ""
    availability_domain = ""
    vcn_cidr_block = ""
    subnet_cidr_block = ""
    instance_display_name = ""
    source_id_arm = ""
    source_id_x86 = ""
  }
}