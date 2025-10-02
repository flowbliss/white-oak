variable "name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "The number of read units for this table"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The number of write units for this table"
  type        = number
  default     = 5
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key"
  type        = string
}

variable "range_key" {
  description = "The attribute to use as the range (sort) key"
  type        = string
  default     = null
}

variable "attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes"
  type = list(object({
    name = string
    type = string
  }))
  default = []
}

variable "global_secondary_indexes" {
  description = "Describe a global secondary index on the table"
  type = list(object({
    name               = string
    hash_key           = string
    range_key          = optional(string)
    write_capacity     = number
    read_capacity      = number
    projection_type    = string
    non_key_attributes = optional(list(string))
  }))
  default = []
}

variable "local_secondary_indexes" {
  description = "Describe a local secondary index on the table"
  type = list(object({
    name               = string
    range_key          = string
    projection_type    = string
    non_key_attributes = optional(list(string))
  }))
  default = []
}

variable "point_in_time_recovery_enabled" {
  description = "Whether to enable point-in-time recovery"
  type        = bool
  default     = true
}

variable "server_side_encryption_enabled" {
  description = "Whether to enable server-side encryption"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
