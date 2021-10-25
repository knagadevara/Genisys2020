data "aws_ami" "get_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = [var.AWS_VIRT_TYP]
  }

  owners = ["099720109477"] ## required argument

  }
