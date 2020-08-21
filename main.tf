# Using a single workspace:
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "chumaiOrg"

    workspaces {
      name = "terraform-labs"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  version    = "~> 3.0"
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_access_key
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tli-aws-nonprod-ifrs-dev"
  cidr = "172.25.131.0/26"

  azs             = ["ap-southeast-1a"]
  private_subnets = ["172.25.131.0/27", "172.25.131.32/27"]
  #public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}