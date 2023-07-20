# Terraform Oracle Cloud Infrastructure (OCI) Free Tier

## Introduction

This repository contains Terraform modules and examples to provision Oracle Cloud Infrastructure (OCI) resources.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)

## Setup

1. Clone this repository and `cd` into it.
2. `mv variables.example.tf variables.tf`
3. Modify `variables.tf`, `local.sh` and other files, replacing the default values with your own.
4. `terraform init`
5. `terraform validate` & fix errors if any.
6. `terraform plan`& fix errors if any.
7. `terraform apply -auto-approve`
8. Use the `out-of-capacity.sh` script to retry the `terraform apply` command until it succeeds.

## Cleanup

1. `terraform destroy -auto-approve`

## References

- [Oracle Cloud Infrastructure Documentation](https://docs.cloud.oracle.com/iaas/Content/home.htm)

## License

This project is licensed under the MIT License

## Author Information

[Suraj Mandal](https://surajmandal.in/)

This project took me 2 days so a star would be appreciated.