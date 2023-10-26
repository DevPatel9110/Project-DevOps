provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "dem0_server" {
  ami = "ami-008b85aa3ff5c1b02"
  instance_type = "t2.micro"
  key_name = "Devopsbuddy"
  security_groups = ["demo_sg"]
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"
  }
}