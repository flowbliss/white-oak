# ---------------------------------------------------------------------------------------------------------------------
# S3 BUCKET UNIT
# This unit creates a secure S3 bucket with versioning and encryption
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  source = "${get_terragrunt_dir()}/../../../../../modules/s3-bucket"
}

inputs = {
  # Required inputs
  name        = values.name
  environment = try(values.environment, "production")

  # Optional inputs with defaults
  block_public_access = try(values.block_public_access, true)
  enable_versioning   = try(values.enable_versioning, true)
  force_destroy       = try(values.force_destroy, false)
}
