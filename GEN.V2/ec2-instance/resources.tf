resource "aws_instance" "devbox" {
    ami=var.AMI_ID
    instance_type="t3.micro"
}