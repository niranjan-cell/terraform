variable "region_east" {
 default = "us-east-1"
 description = "AWS Region"
}
variable "region_west" {
 default = "us-west-2"
 description = "AWS Region"
}
variable "type" {
 default = "t2.micro"
 description = "Size of VM"
}
variable "ami_east" {
 default = "ami-09d56f8956ab235b3"
 description = "Amazon Machine Image ID for Ubuntu Server 20.04"
}
variable "ami_west" {
 default = "ami-0ee8244746ec5d6d4"
 description = "Amazon Machine Image ID for Ubuntu Server 20.04"
}