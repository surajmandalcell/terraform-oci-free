#!/bin/bash

# Define the path to your private key file
private_key_path="/Users/surajmandal/Desktop/dev.nosync/cloud/keys/_personal/oracle.cer"

# Function to validate the IP address format
function is_valid_ip {
    local ip=$1
    # Regular expression to match the IP address format (IPv4 or IPv6)
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] || [[ $ip =~ ^[0-9a-fA-F:]+$ ]]; then
        return 0 # Valid IP address format
    else
        return 1 # Invalid IP address format
    fi
}

# Function to update or add an entry in the .ssh/config file
function update_ssh_config {
    local host=$1
    local host_name=$2
    
    if grep -q "Host $host" ~/.ssh/config; then
        # If the host entry already exists, update the HostName line
        sed -i '' -e "s/^ *HostName.*/    HostName $host_name/" ~/.ssh/config
    else
        echo "" >> ~/.ssh/config
        # If the host entry does not exist, add it to the .ssh/config file
        echo "Host $host" >> ~/.ssh/config
        echo "    HostName $host_name" >> ~/.ssh/config
        echo "    User ubuntu" >> ~/.ssh/config
        echo "    IdentityFile $private_key_path" >> ~/.ssh/config
    fi
}

# Get the public IP addresses of instance-1, instance-2, and instance-3 from the Terraform output
instance_1_ip=$(terraform output -raw public_ip_arm_1 2>&1)
instance_2_ip=$(terraform output -raw public_ip_x86_1 2>&1)
instance_3_ip=$(terraform output -raw public_ip_x86_2 2>&1)

# Update or add the oci1 entry in .ssh/config (if instance_1_ip is a valid IP address)
if is_valid_ip "$instance_1_ip"; then
    update_ssh_config "oci1" "$instance_1_ip"
fi

# Update or add the oci2 entry in .ssh/config (if instance_2_ip is a valid IP address)
if is_valid_ip "$instance_2_ip"; then
    update_ssh_config "oci2" "$instance_2_ip"
fi

# Update or add the oci3 entry in .ssh/config (if instance_3_ip is a valid IP address)
if is_valid_ip "$instance_3_ip"; then
    update_ssh_config "oci3" "$instance_3_ip"
fi
