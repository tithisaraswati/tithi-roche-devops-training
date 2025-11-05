#creating EC2 Vm
resource "aws_instance" "example" {
    #ami = "ami-0a25a306450a2cba3"
    ami = var.tithi-ami-id
    instance_type = var.vm-size #"t2.nano"
    key_name = aws_key_pair.deployer.key_name
    #changing tags_all to tags
    tags = {
      "Name" = var.vm-name #"tithi-vm-1"
    }
  
}

