terraform {
    backend "s3" {
        bucket = "terraform-state-globalvpc"
        key = "terraform-state-globalvpc/terraform.tfstate"
        region = "us-east-1"
        profile = "default"
    }
}