# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "bucket" {
  bucket        = var.name
  force_destroy = var.force_destroy

  tags = {
    Name        = var.name
    Environment = var.environment
    ManagedBy   = "terragrunt"
    Project     = "white-oak"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# ENABLE VERSIONING
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# BLOCK PUBLIC ACCESS
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket_public_access_block" "public_access" {
  count                   = var.block_public_access ? 1 : 0
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ---------------------------------------------------------------------------------------------------------------------
# SERVER SIDE ENCRYPTION
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}