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
# calling module 

module "my-ashutoshh-module-ec2" {
    tithi-ami-id = "ami-0a25a306450a2cba3"
    source = "./modules/ec2"
    vm-name = "tithi-day3"
    vm-size = "t2.nano"
    ec2-key-name = "tithi-day3-training"
    private-key-algo = "RSA"
    key-size = 4096
    my-vpc-id = "vpc-02d56e9aa1ce2f114"
    my-security-group = "tithi-sec-grp"
    vm-key_name = "tithi-vm"
    novm = 2
}