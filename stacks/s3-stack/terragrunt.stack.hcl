# ---------------------------------------------------------------------------------------------------------------------
# S3 STACK
# This stack creates a secure S3 bucket using the s3-bucket unit
# ---------------------------------------------------------------------------------------------------------------------

locals {
  name = values.name
}

unit "s3_bucket" {
  source = "../../units/s3-bucket"
  
  path = "s3_bucket"
  
  values = {
    name = local.name
    
    # S3 bucket configuration
    environment        = try(values.environment, "production")
    block_public_access = try(values.block_public_access, true)
    enable_versioning   = try(values.enable_versioning, true)
    force_destroy       = try(values.force_destroy, false)
  }
}
