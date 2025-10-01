# ---------------------------------------------------------------------------------------------------------------------
# PRODUCTION S3 STACK
# Production environment configuration for S3 bucket stack
# ---------------------------------------------------------------------------------------------------------------------

locals {
  name = "white-oak-prod-s3-bucket"
}

unit "s3_bucket" {
  source = "../../../units/s3-bucket"
  
  path = "s3_bucket"
  
  values = {
    name = local.name
    
    # Production S3 bucket configuration
    environment        = "production"
    block_public_access = true
    enable_versioning   = true
    force_destroy       = false  # Never destroy in production
  }
}
