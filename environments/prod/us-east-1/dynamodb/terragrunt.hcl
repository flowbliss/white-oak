# Include the root terragrunt.hcl configuration
include "root" {
  path = find_in_parent_folders()
}

# Configure this unit to use the DynamoDB module
terraform {
  source = "../../../../modules/dynamodb"
}

# Input variables for this unit
inputs = {
  name        = "white-oak-prod-dynamodb-table"
  environment = "production"
  project     = "white-oak"
  hash_key    = "id"
  
  attributes = [
    {
      name = "id"
      type = "S"
    },
    {
      name = "created_at"
      type = "S"
    }
  ]
  
  global_secondary_indexes = [
    {
      name               = "CreatedAtIndex"
      hash_key           = "id"
      range_key          = "created_at"
      write_capacity     = 5
      read_capacity      = 5
      projection_type    = "INCLUDE"
      non_key_attributes = ["data"]
    }
  ]
  
  tags = {
    Purpose = "testing-implicit-stack"
  }
}
