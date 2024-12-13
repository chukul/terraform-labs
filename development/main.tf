terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-atlantis"  # Replace with your bucket name
    key            = "terraform.tfstate"         # Path to the state file in the bucket
    region         = "ap-southeast-1"                 # Replace with your bucket region
    encrypt        = true                        # Enable encryption
  }
}

provider "aws" {
  region = "ap-southeast-1" # Replace with your desired region
}
