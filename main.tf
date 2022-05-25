terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 3.0"
   }
 }
}

provider "aws" {
 region = var.region
}

variable "region" {
 default = "us-east-1"
 description = "AWS Region"
}

variable "ami" {
 default = "ami-0c4f7023847b90238"
 description = "Amazon Machine Image ID for Ubuntu Server 20.04"
}

variable "type" {
 default = "t2.micro"
 description = "Size of VM"
}

variable "key" {
 default = "ram"
 description = "Key Name"
}


resource "aws_instance" "demo" {
 ami = var.ami
 instance_type = var.type
 security_groups = [aws_security_group.allow_tls.name]
 key_name = var.key

 tags = {
   name = "Demo System"
 }
}


resource "default_vpc" "main" {
  tags = {
      name= "main"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = default_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [default_vpc.main.cidr_block]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [default_vpc.main.cidr_block]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "ssh"
    cidr_blocks      = [default_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
    instance_name = "demo"
  }
}
