terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }
  }
  required_version = ">= 1.1.0"
  backend "s3" {
    bucket         = "torchpaper.com.github-actions"  # Bucket for state files
    key            = "terraform/state"                # Replace with your desired state file path
    region         = "us-east-1"                    
    dynamodb_table = "terraform-locks"                # DynamoDB table for locking
    encrypt        = true                             # Enable encryption
  }
}