#public ip of my ec2 vm
output "my-ec2-pub-ip" {
  value = aws_instance.example[*].public_ip
}


#Ec2 Instance Id
output "my-ec2-id" {
  value = aws_instance.example[*].id
}
# storing data 
resource "local_file" "my-ip-data" {
  content  =  join("\n",aws_instance.example[*].public_ip)
  filename = "${path.module}/ansible-inventory.txt"
  #Making manual dependency 
  depends_on = [ aws_instance.example ]
}

