
## If no result is returned then there will be an error

locals {
  tags = {
    "ApplicationName" = "Xandora"
    "ServerType"      = "Linux ${data.aws_ami.get_image.id}"
    # "ServerType"      = "Linux ${var.AMI_ID}"
    "EMV"             = "${terraform.workspace}"
  }
}


resource "aws_instance" "Xapp_WEB" {
  ami = "${data.aws_ami.get_image.id}"
  instance_type = var.Xapp_SHAPE
  count         = var.Xapp_SET
  tags          = local.tags

}

