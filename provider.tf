provider "aws" {
   
   region = var.AWSRGN
   version = "~> 3.0"
   access_key   = var.AWSKEY
   secret_key   = var.AWSSEC

}