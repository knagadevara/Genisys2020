variable "AWSKEY" {
    type = string
    description = "AWS accesskey for API user"
}

variable "AWSSEC" {
    type = string
    description = "AWS secret key for API user"
}

variable AWSRGN {
    type = string
    description = "AWS region for API user"
    default = "us-east-1"
}