# Datasource to fetch the information from the VPC Remote Statefile

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "adnan-tf-state-bucket"
    key     = "vpc/${var.ENV}/terraform.tfstate"
    region  = "us-east-1"
  }
}
