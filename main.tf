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
# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "tli-aws-nonprod-ifrs-dev"
#   cidr = "172.25.131.0/26"

#   azs             = ["ap-southeast-1a"]
#   private_subnets = ["172.25.131.0/27", "172.25.131.32/27"]
#   #public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = false
#   enable_vpn_gateway = false

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }

# module "vote_service_sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "user-service"
#   description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
#   vpc_id      = "${module.vpc.vpc_id}"

#   ingress_cidr_blocks      = ["172.25.0.0/16","172.24.0.0/16","10.102.0.0/16","206.1.1.0/24","206.1.2.0/24","192.168.0.0/16"]
#   ingress_rules            = ["all-all"]
#   egress_rules             = ["all-all"]
#   # ingress_with_cidr_blocks = [
#   #   {
#   #     from_port   = 8080
#   #     to_port     = 8090
#   #     protocol    = "tcp"
#   #     description = "User-service ports"
#   #     cidr_blocks = "10.10.0.0/16"
#   #   },
#   #   {
#   #     rule        = "postgresql-tcp"
#   #     cidr_blocks = "0.0.0.0/0"
#   #   },
#   # ]
# }

# module "ec2_cluster" {
#   source                 = "terraform-aws-modules/ec2-instance/aws"
#   version                = "~> 2.0"

#   name                   = "my-cluster"
#   instance_count         = 1

#   ami                    = "ami-097e78d10c4722996"
#   instance_type          = "t2.micro"
#   key_name               = "tli-keypair"
#   monitoring             = true
#   vpc_security_group_ids = [module.vote_service_sg.this_security_group_id]
#   subnet_id              = module.vpc.private_subnets[0]
#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }