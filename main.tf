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

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_tagging" "my_bucket_tags" {
  bucket = aws_s3_bucket.my_bucket.id

  tag_set {
    key   = "Name"
    value = var.bucket_name
  }

  tag_set {
    key   = "Environment"
    value = "dev"
  }
}
