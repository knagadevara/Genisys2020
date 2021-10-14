terraform {
  required_providers{
      aws={
          source="hashicorp/aws"
          version="~> 3.5"
      }
  }
}


provider "aws" {
    profile="default"
    region=var.AZ_US_EST1
}

provider "aws" {
    alias = "aws-vdc-2"
    profile="default"
    region=var.AZ_US_EST2
}