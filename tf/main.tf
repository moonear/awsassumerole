terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
  }
}

provider "aws" {
  assume_role {
    role_arn = var.aws_assume_role_arn
  }
}

resource "aws_s3_bucket" "b" {
}

resource "aws_s3_bucket_public_access_block" "bpermissions" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}