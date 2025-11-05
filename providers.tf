terraform {
  backend "s3" {
    bucket         = "tithi-terraform-bucket"
    key            = "dev/tithi/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "tithi-roche-table1" # Optional, for DynamoDB locking
      
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # region location
  region= "ap-southeast-2"
}
