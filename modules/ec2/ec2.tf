#creating EC2 Vm
resource "aws_instance" "example" {
    #ami = "ami-0a25a306450a2cba3"
    ami = var.tithi-ami-id
    count = var.novm
    instance_type = var.vm-size #"t2.nano"
    key_name = aws_key_pair.deployer.key_name
    #security_groups = aws_security_group.example.name
    vpc_security_group_ids = [ aws_security_group.allow_tls.id]
    #changing tags_all to tags
    tags = {
      "Name" = "${var.vm-name}-${count.index}"
    }
     depends_on = [ tls_private_key.my_private_key, aws_key_pair.deployer ]
  

  # #terraform provisioner
  # provisioner "remote-exec"{
  #     inline = [ 
  #       "sudo dnf install git httpd -y",
  #       "mkdir -p hello/terraform"
  #      ]
  # }
  # connection {
  #   type = "ssh"
  #   user = "ec2-user"
  #   host = self.public_ip
  #   #content if private key data
  #   timeout = "3m"
  #   private_key= tls_private_key.my_private_key.private_key_pem
  # }


}