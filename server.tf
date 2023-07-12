terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name = "prabhakar-keypair"

  tags = {
    Name = "Prabhakar-DevOps-batch-server"
    env = "Production"
    owner = "Raman Khanna"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

