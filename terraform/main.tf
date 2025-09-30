# Terraform configuration for Digger CI/CD testing
# S3 bucket removed - testing Digger destroy functionality
# This change should trigger Digger to detect the removal

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  # Backend configuration to store state in S3
  backend "s3" {
    bucket = "digger-terraform-state-bucket-${random_id.state_suffix.hex}"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create S3 bucket for Terraform state storage
resource "aws_s3_bucket" "terraform_state" {
  bucket = "digger-terraform-state-bucket-${random_id.state_suffix.hex}"

  tags = {
    Name        = "Digger Terraform State Bucket"
    Environment = "production"
    ManagedBy   = "digger"
    Purpose     = "terraform-state"
  }
}

resource "random_id" "state_suffix" {
  byte_length = 4
}

# S3 bucket module removed - this will destroy the existing bucket
# Adding a comment to ensure Digger detects this change

