# Gcp is the easiest to setup and free to use
# Just create a firebase project and enable storage
terraform {
  backend "gcs" {
    bucket = "suraj-personal.appspot.com"
    prefix = "terraform/state-tor"
  }
}
