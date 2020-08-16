# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_access_key
}

# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block       = var.vpc_cidr
    tags = {
    Name = "MyVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.terra_vpc.id
}

# Subnets : public
resource "aws_subnet" "public" {
  count = length(var.subnets_cidr)
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = element(var.subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "a" {
  count = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_network_interface" "ec2_nic" {
  count = length(var.subnets_cidr)-1
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  private_ips = ["10.20.1.10"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "ec2_vm" {
  ami           = "ami-08569b978cc4dfa10" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.ec2_nic[0].id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
