locals {
  script_1 = <<-EOF
      #!/bin/bash
      echo "ubuntu:${local.default_password}" | sudo chpasswd
      sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
      sudo service ssh restart
    EOF
}

resource "oci_core_volume" "block-volume-1" {
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
  size_in_gbs         = 50
}

resource "oci_core_instance" "instance-1" {
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
  display_name        = "${local.instance_display_name}-1"
  shape               = "VM.Standard.A1.Flex"

  shape_config {
    memory_in_gbs = 24
    ocpus         = 4
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.subnet.id
    display_name              = "arm-vnic"
    assign_public_ip          = true
    assign_private_dns_record = true
  }

  source_details {
    source_type             = "image"
    source_id               = local.source_id_arm
    boot_volume_size_in_gbs = 50
  }

  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Bastion"
    }
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "oci_core_instance" "instance-2" {
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
  display_name        = "${local.instance_display_name}-2"
  shape               = "VM.Standard.E2.1.Micro"

  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.subnet.id
    display_name              = "x86-vnic-1"
    assign_public_ip          = true
    assign_private_dns_record = true
  }

  source_details {
    source_type             = "image"
    source_id               = local.source_id_x86
    boot_volume_size_in_gbs = 50
  }

  metadata = {
    ssh_authorized_keys = file(local.public_key_path)
    user_data           = base64encode(local.script_1)
  }

  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Bastion"
    }
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "oci_core_instance" "instance-3" {
  availability_domain = local.availability_domain
  compartment_id      = local.compartment_id
  display_name        = "${local.instance_display_name}-3"
  shape               = "VM.Standard.E2.1.Micro"

  shape_config {
    memory_in_gbs = 1
    ocpus         = 1
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.subnet.id
    display_name              = "x86-vnic-2"
    assign_public_ip          = true
    assign_private_dns_record = true
  }

  source_details {
    source_type             = "image"
    source_id               = local.source_id_x86
    boot_volume_size_in_gbs = 50
  }

  metadata = {
    ssh_authorized_keys = file(local.public_key_path)
    user_data           = base64encode(local.script_1)
  }

  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Bastion"
    }
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}
