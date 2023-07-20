# Remove "example_" from the variable name and fill in the values
variable "example_zone" { # Replace with your oci zone
  type = any
  default = {
    tenancy_ocid          = ""
    user_ocid             = ""
    api_key_fingerprint   = ""
    private_key_path      = ""
    region                = ""
    compartment_id        = ""
    availability_domain   = ""
    vcn_cidr_block        = ""
    subnet_cidr_block     = ""
    instance_display_name = ""
    source_id_arm         = ""
    source_id_x86         = ""
    default_password      = "Pzwfp^S@DBwk"
    public_key_path       = ""
  }
}
