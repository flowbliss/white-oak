# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION FOR DIGGER
# This file allows Digger to work with our Terragrunt stack
# ---------------------------------------------------------------------------------------------------------------------

include "root" {
  path = find_in_parent_folders()
}

# Configure Terragrunt to use the S3 bucket unit
terraform {
  source = "${get_terragrunt_dir()}/../../../units/s3-bucket"
}

inputs = {
  # Production S3 bucket configuration
  name        = "white-oak-prod-s3-bucket"
  environment = "production"
  block_public_access = true
  enable_versioning   = true
  force_destroy       = false
}
