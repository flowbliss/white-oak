# Include the root terragrunt.hcl configuration
include "root" {
  path = find_in_parent_folders()
}

# Configure this unit to use the S3 bucket module
terraform {
  source = "../../../../modules/s3-bucket"
}

# Input variables for this unit
inputs = {
  name        = "white-oak-prod-s3-bucket"
  environment = "production"
  project     = "white-oak"
}