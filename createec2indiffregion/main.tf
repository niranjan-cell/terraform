resource "aws_instance" "demo-west" {
    provider = aws.aws_west
    ami = var.ami_west
    instance_type = var.type
    tags = {
    name = "Demo System"
}

}
resource "aws_instance" "demo-east" {
    provider = aws.aws_east
    ami = var.ami_east
    instance_type = var.type
    key_name = "ram"
    tags = {
        name = "Demo System"
}
}