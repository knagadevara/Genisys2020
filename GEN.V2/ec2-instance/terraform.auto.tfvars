AWS_VIRT_TYP     = "hvm"
AMI_ID           = "ami-0184675ff8c65c0bc"
AZ_US_EST1       = "us-east-1"
AZ_US_EST2       = "us-east-2"
DEV_Xapp_SET     = 2
STG_Xapp_SET     = 4
TST_Xapp_SET     = 4
PRD_Xapp_SET     = 10
DEV_Xapp_SHAPE   = "t3.micro"
STG_Xapp_SHAPE   = "t3.micro"
TST_Xapp_SHAPE   = "m5.large"
PRD_Xapp_SHAPE   = "m5.xlarge"
Xapp_SYS_ADMIN   = ["batman", "superman", "wolferine", "sandman"]
IAM_UserFilePath = "../SAdminUsers.csv"
IAM_ALtUsrPath   = "SAdminUsers.csv"


WEB_PORTS_PUBLIC_MAP = {
  "WEB_N" = {
    protocol    = "tcp",
    port        = 80,
    source      = ["0.0.0.0/0"],
    description = "Public access to Website forward to HTTPS"
  },

  "WEB_H" = {
    protocol    = "tcp",
    port        = 443,
    source      = ["0.0.0.0/0"],
    description = "Public access to Website Secured"
  },

  "SSH" = {
    protocol    = "tcp",
    port        = 22,
    source      = ["10.15.175.0/24", "10.15.176.0/24", "10.15.177.0/24"],
    description = "SSH ACCESS"
  },

  "DB_ORA" = {
    protocol    = "tcp",
    port        = 8080,
    source      = ["10.15.176.35/32"],
    description = "DB Connectivity"
  },

  "REDIS_CACHE" = {
    protocol    = "tcp",
    port        = 23241,
    source      = ["10.15.177.100/32"],
    description = "Redis DB Connectivity"
  }
}


# IAM_UserFilePath = "${path.module}/SAdminUsers.csv" ## cannnot use variable reference in the terraform.auto.tfvars
# UserMap = { AWS_IAM_SADMIN = { users = [ 
#     "batman"  ,
#     "superman" , 
#     "wolferine" , 
#     "sandman" ] } }