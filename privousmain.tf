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

resource "aws_instance" "demo" {
 ami = var.ami
 instance_type = var.type
 key_name = "strombrekar"  
 vpc_security_group_ids = ["sg-0c365fc8ea427fb0b"]
 subnet_id = "subnet-05156c5b0f37feb6d"
 tags = {
   name = "Demo System"
 }
}
