
module "Xapp-VPC" {
  source = "../../modules/vpc"
}


module "Xapp-IAM" {
  source = "../../modules/iam"
}


module "Xapp-SG" {
  source = "../../modules/secgrp"
}


module "Xapp-S3" {
  source = "../../modules/storage_s3"
}

module "Xapp-EC2-WEBServer" {
  source = "../../modules/ec2"
  Xapp_SHAPE = "c5.large"
  Xapp_SET = "10"
}