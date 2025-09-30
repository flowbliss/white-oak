# Terraform configuration for Digger CI/CD testing
# This will create an S3 bucket with proper security configurations
# Testing Digger apply functionality via PR comments
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Use the S3 bucket module
module "s3_bucket" {
  source = "../modules/s3-bucket"
}

# Outputs from the module
output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "bucket_domain_name" {
  value = module.s3_bucket.bucket_domain_name
}

