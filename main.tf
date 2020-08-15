# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "ap-southeast-1"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.123.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
