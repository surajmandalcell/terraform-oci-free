# Remove _example from the variable name

variable "example_backend" {
  default = {
    bucket                      = "<Bucket>"
    key                         = "<Key/PathOnBucket>"
    region                      = "<Region>"
    endpoint                    = "https://<Namespace>.compat.objectstorage.<Region>.oraclecloud.com"
    access_key                  = "<AccessKey>"
    secret_key                  = "<SecretKey>"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

variable "example_zone" {
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
