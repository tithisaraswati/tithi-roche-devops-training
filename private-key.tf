#creating private keys based RSA 4096
resource "tls_private_key" "my_private_key" {
  algorithm = var.private-key-algo
  rsa_bits  = var.key-size
}

#save private keys
#storing private key
resource "local_file" "my-private-key-data" {
  content  =  tls_private_key.my_private_key.private_key_pem
  filename = "${path.module}/tithi-private-key.pem"
  file_permission = 0400
}

#send public key in aws cloud account

resource "aws_key_pair" "deployer" {
    public_key = tls_private_key.my_private_key.public_key_openssh
    key_name = "tithi-terraform ppublic-key"
  
}