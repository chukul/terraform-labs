provider "aws" {
  region = "ap-southeast-1" # Replace with your desired region
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-southeast-1a" # Replace with your desired availability zone
  size              = 10               # Size in GB
  type              = "gp3"            # General Purpose SSD (gp2)

  tags = {
    Name = "prod-example-ebs-volume"
    map-migrated = "migJL95TU4VS9"
    CostCenter = "Engineering"
    Env = "CCoE"
    Owner = "Sre-Team"
    EmailCreator = "chuchai.k@cimbthai.com"
    ProjectName = "Pool"
  }
}
