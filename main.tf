provider "aws" {
  region = "ap-southeast-1"  # Replace with your desired region
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-southeast-1"  # Replace with your desired availability zone
  size              = 10            # Size in GB
  type              = "gp3"         # General Purpose SSD (gp2)

  tags = {
    Name = "example-ebs-volume"
  }
}