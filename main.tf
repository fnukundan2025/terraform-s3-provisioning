terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "My-Terraform-Project-demo"

    workspaces {
      name = "terraform-s3-provisioning"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = {
    Name        = "Demo S3 Bucket"
    Environment = "Dev"
