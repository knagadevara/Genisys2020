
locals {
  tags={
      "ApplicationName"="Xandora"
      "ServerType"="Linux ${var.AMI_ID}"
  }
}

resource "aws_instance" "Xapp_WEB_PRD"{
    ami=var.AMI_ID
    instance_type=var.Xapp_ENVIRONMENT_TYPE=="PRD" ? var.PRD_Xapp_SHAPE : "t3.micro"
    count = var.Xapp_ENVIRONMENT_TYPE=="PRD" ? var.PRD_Xapp_SET : 0
    tags = local.tags
}

resource "aws_instance" "Xapp_WEB_STG" {
    ami=var.AMI_ID
    instance_type=var.Xapp_ENVIRONMENT_TYPE=="STG" ? var.STG_Xapp_SHAPE : "t3.micro"
    count = var.Xapp_ENVIRONMENT_TYPE=="STG" ? var.STG_Xapp_SET : 0
    tags = local.tags
}

resource "aws_instance" "Xapp_WEB_TST" {
    ami=var.AMI_ID
    instance_type=var.Xapp_ENVIRONMENT_TYPE=="TST" ? var.TST_Xapp_SHAPE : "t3.micro"
    count = var.Xapp_ENVIRONMENT_TYPE=="TST" ? var.TST_Xapp_SET : 0
    tags = local.tags
}

resource "aws_instance" "Xapp_WEB_DEV" {
    ami=var.AMI_ID
    instance_type=var.Xapp_ENVIRONMENT_TYPE=="DEV" ? var.DEV_Xapp_SHAPE : "t3.micro"
    count = var.Xapp_ENVIRONMENT_TYPE=="DEV" ? var.DEV_Xapp_SET : 0 
    tags = local.tags
}