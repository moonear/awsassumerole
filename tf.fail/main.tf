terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# NOTE aws role has conditional access providing full access to aws region us-west-2 ONLY
# UnHappy Path as region is NOT allowed by policy

provider "aws" {
  profile = "default"
  region  = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::000000000000:role/DeveloperRole"
  }
}

resource "aws_s3_bucket" "b" {
}