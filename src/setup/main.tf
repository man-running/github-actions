# In this TF script we need to setup a dynamodb table and a bucket for the TF backend

# -- Create an S3 bucket --------------------------------------------------------------------------------

resource "aws_s3_bucket" "actions_bucket" {
  bucket = "torchpaper.com.github-actions"

  tags = {
    Name   = "terraform-backend-bucket"
    system = "scaffolding"
    iac    = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "actions_bucket_versioning" {
  bucket = aws_s3_bucket.actions_bucket.id
  versioning_configuration {
    status = "Disabled" # Or "Enable" if you want versioning enabled
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "actions_bucket_encryption" {
  bucket = aws_s3_bucket.actions_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # Or "aws:kms"
    }
  }
}

# -- Create Dynamo DB table --------------------------------------------------------------------------------

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform-locks"
  billing_mode   = "PAY_PER_REQUEST" # Use on-demand billing
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"  # String
  }

  tags = {
    Name = "Terraform State Locking"
  }
}