
## If no result is returned then there will be an error
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


locals {
  tags = {
    "ApplicationName" = "Xandora"
    "ServerType"      = "Linux ${data.aws_ami.get_image.id}"
    "EMV"             = "${terraform.workspace}"
  }
}


resource "aws_instance" "Xapp_WEB" {
  ami           = data.aws_ami.get_image.id
  instance_type = var.Xapp_SHAPE
  count         = var.Xapp_SET
  tags          = local.tags
}

