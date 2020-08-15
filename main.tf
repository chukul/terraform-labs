# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "ap-southeast-1"
  access_key = var.access_key
  secret_key = var.secret_access_key
}

resource "aws_vpc" "main" {
  cidr_block       = "10.123.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
