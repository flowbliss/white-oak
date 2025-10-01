# ---------------------------------------------------------------------------------------------------------------------
# VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment name"
  type        = string
  default     = "production"
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  type        = bool
  default     = false
}

variable "block_public_access" {
  description = "Whether to block public access to the bucket"
  type        = bool
  default     = true
}

variable "enable_versioning" {
  description = "Whether to enable versioning on the bucket"
  type        = bool
  default     = true
}
