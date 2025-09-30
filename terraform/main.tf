# Terraform configuration for Digger CI/CD testing
# S3 bucket removed - testing Digger destroy functionality
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

# S3 bucket module removed - this will destroy the existing bucket

