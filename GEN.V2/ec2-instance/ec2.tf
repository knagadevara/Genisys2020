
## If no result is returned then there will be an error
data "aws_ami" "get_image" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd-server-*"]
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
  }
}


resource "aws_instance" "Xapp_WEB_PRD" {
  ami           = data.aws_ami.get_image.id
  instance_type = var.Xapp_ENVIRONMENT_TYPE == "PRD" ? var.PRD_Xapp_SHAPE : "t3.micro"
  count         = var.Xapp_ENVIRONMENT_TYPE == "PRD" ? var.PRD_Xapp_SET : 0
  tags          = local.tags
}

resource "aws_instance" "Xapp_WEB_STG" {
  ami           = data.aws_ami.get_image.id
  instance_type = var.Xapp_ENVIRONMENT_TYPE == "STG" ? var.STG_Xapp_SHAPE : "t3.micro"
  count         = var.Xapp_ENVIRONMENT_TYPE == "STG" ? var.STG_Xapp_SET : 0
  tags          = local.tags
}

resource "aws_instance" "Xapp_WEB_TST" {
  ami           = data.aws_ami.get_image.id
  instance_type = var.Xapp_ENVIRONMENT_TYPE == "TST" ? var.TST_Xapp_SHAPE : "t3.micro"
  count         = var.Xapp_ENVIRONMENT_TYPE == "TST" ? var.TST_Xapp_SET : 0
  tags          = local.tags
}

resource "aws_instance" "Xapp_WEB_DEV" {
  ami           = data.aws_ami.get_image.id
  instance_type = var.Xapp_ENVIRONMENT_TYPE == "DEV" ? var.DEV_Xapp_SHAPE : "t3.micro"
  count         = var.Xapp_ENVIRONMENT_TYPE == "DEV" ? var.DEV_Xapp_SET : 0
  tags          = local.tags
}

