terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "mybucket2115bc48"
    key    = "tfstate"
    region = "us-east-2"
  }
}

# NOTE aws role has conditional access providing full access to aws region us-west-2 ONLY
# Happy Path

provider "aws" {
  profile = "default"
  region  = "us-west-2"

  assume_role {
    role_arn = "arn:aws:iam::000000000000:role/DeveloperRole"
  }
}

resource "aws_s3_bucket" "b" {
}