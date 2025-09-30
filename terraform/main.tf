# Sample Terraform configuration for testing Digger
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create a simple S3 bucket for testing
resource "aws_s3_bucket" "test_bucket" {
  bucket = "digger-test-bucket-${random_id.bucket_suffix.hex}"
  
  tags = {
    Name        = "Digger Test Bucket"
    Environment = "test"
    ManagedBy   = "digger"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Add some output for visibility
output "bucket_name" {
  value = aws_s3_bucket.test_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.test_bucket.arn
}

