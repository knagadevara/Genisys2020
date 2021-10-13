variable "AWSKEY" {
    type = string
    description = "AWS accesskey for API user"
}

variable "AWSSEC" {
    type = string
    description = "AWS secret key for API user"
}

variable "AWSRGN" {
    type = string
    description = "AWS region for API user"
    default = "us-east-1"
}

# variable "SUBNET" {
#     type = list(string)
#     description = "VDC2 Subnets"
#     default = {
        
#         "vpcPrimarySubnet"    = "10.10.0.0/16"
#         "vpcSecondarySubnet"  = "10.20.0.0/16"
#         "vpcDefaultSubnet"    = "0.0.0.0/0"
#     }
#  }
## I exported the variable to the shell runtime
## TF_VARS_AWSKEY="<key>"
## TF_VARS_AWSSEC="<secret>"
## TF_VARS_AWSRGN="<region>"
