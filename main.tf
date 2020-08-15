# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "ap-southeast-1"
  access_key = var.access_key
  secret_key = var.secret_access_key
}
