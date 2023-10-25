provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "dem0_server" {
  ami = "ami-008b85aa3ff5c1b02"
  instance_type = "t2.micro"
  key_name = "Devopsbuddy"
}