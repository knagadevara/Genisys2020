terraform {
    backend "s3" {
        bucket = "terraform-state-backend-genisys2020"
        key = "terraform-state-backend-genisys2020/s3/terraform.tfstate"
        region = "us-east-1"
        profile = "default"
        encrypt = true
    }
}