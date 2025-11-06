variable "tithi-ami-id" {
  type = string
  description = "This is my Sydny region AMI ID"
 # default = "ami-0a25a306450a2cba3"
}

variable "vm-name" {
  type= string
  description = "my Aws Vm Name"
}
variable "vm-size"{
  type = string
}

variable "vm-key_name" {
  type = string
}

variable "private-key-algo" {
    type= string
  
}
variable "key-size"{
    type= number
}
variable "ec2-key-name"{
    type= number
}