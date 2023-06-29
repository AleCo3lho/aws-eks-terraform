provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "coelhor-dev-tfstate"
    key    = "eks/coelhor-dev/terraform.tfstate"
    region = "us-east-1"
  }
}