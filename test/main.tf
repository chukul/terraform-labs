provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "test" {
  bucket = "terrakube-test-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}
