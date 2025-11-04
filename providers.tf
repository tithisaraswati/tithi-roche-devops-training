terraform {
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
#creating EC2 Vm
resource "aws_instance" "example" {
    ami = "ami-0a25a306450a2cba3"
    instance_type = "t2.nano"
    key_name = "roche-key"
    tags_all = {
      "Name" = "tithi-vm-1"
    }
  
}