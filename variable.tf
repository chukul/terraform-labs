variable "access_key" {
  type        = string
  description = "access_key"
}

variable "secret_access_key" {
  type        = string
  description = "secret_access_key"
}

variable "aws_region" {
	default = "ap-southeast-1"
}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr" {
	type = list(string)
	default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
	type = list(string)
	default = ["ap-southeast-1a", "ap-southeast-1b"]
}
