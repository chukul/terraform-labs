terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-atlantis"  # Replace with your bucket name
    key            = "labs/${terraform.workspace}/terraform.tfstate"         # Path to the state file in the bucket
    region         = "ap-southeast-1"                 # Replace with your bucket region
    encrypt        = true                        # Enable encryption
  }
}

provider "aws" {
  region = "ap-southeast-1" # Replace with your desired region
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-southeast-1a" # Replace with your desired availability zone
  size              = 10               # Size in GB
  type              = "gp3"            # General Purpose SSD (gp2)

  tags = {
    Name = "dev-example-ebs-volume"
    map-migrated = "migJL95TU4VS9"
    CostCenter = "Engineering"
    Env = "CCoE"
    Owner = "Sre-Team"
    EmailCreator = "chuchai.k@cimbthai.com"
    ProjectName = "Pool"
  }
}
