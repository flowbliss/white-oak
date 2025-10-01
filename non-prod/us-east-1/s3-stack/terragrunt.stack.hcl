# ---------------------------------------------------------------------------------------------------------------------
# NON-PRODUCTION S3 STACK
# Non-production environment configuration for S3 bucket stack
# ---------------------------------------------------------------------------------------------------------------------

locals {
  name = "white-oak-nonprod-s3-bucket"
}

unit "s3_bucket" {
  source = "../../../units/s3-bucket"
  
  path = "s3_bucket"
  
  values = {
    name = local.name
    
    # Non-production S3 bucket configuration
    environment        = "non-production"
    block_public_access = true
    enable_versioning   = true
    force_destroy       = true   # Allow destruction in non-prod for testing
  }
}
