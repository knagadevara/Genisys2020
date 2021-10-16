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

VPC_FABRIC      = "10.15.0.0/16"
VPC_OPEN_CIDR   = "0.0.0.0/0"
VPC_WEB_SUBNETS = "10.15.175.0/24"
VPC_DB_SUBNETS  = "10.15.176.0/24"

WEB_PORTS_PUBLIC_MAP = {
  "WEB_N" = {
    protocol    = "tcp",
    from_port   = 80,
    to_port     = 80,
    cidr_blocks = ["0.0.0.0/0"],
    description = "Public access to Website forward to HTTPS"
  },

  "WEB_H" = {
    protocol    = "tcp",
    from_port   = 443,
    to_port     = 443,
    cidr_blocks = ["0.0.0.0/0"],
    description = "Public access to Website Secured"
  },

  "SSH" = {
    protocol    = "tcp",
    from_port   = 22,
    to_port     = 22,
    cidr_blocks = ["10.15.175.0/24", "10.15.176.0/24"],
    description = "SSH ACCESS"
  },

  "DB_ORA" = {
    protocol    = "tcp",
    from_port   = 8080,
    to_port     = 8081,
    cidr_blocks = ["10.15.176.35/32"],
    description = "DB Connectivity"
  },

  "REDIS_CACHE" = {
    protocol    = "tcp",
    from_port   = 23142,
    to_port     = 23143,
    cidr_blocks = ["10.15.176.100/32"],
    description = "Redis DB Connectivity"
  }
}


NACL_EGRESS_ROUTE_RULES = {
  "vdc2_vpc_nacl_rule_egress_default" = {
    rule_no     = 210
    action      = "allow"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  "vdc2_vpc_nacl_rule_egress" = {
    rule_no     = 220
    action      = "allow"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "10.15.0.0/16"
  }
}

NACL_INRESS_ROUTE_RULES = {
  "vdc2_vpc_nacl_rule_ingress_default" = {
    rule_no     = 210
    action      = "allow"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "10.15.0.0/16"
  },
  "vdc2_vpc_nacl_rule_ingress_WEB_HTTP" = {
    rule_no     = 220
    action      = "allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  "vdc2_vpc_nacl_rule_ingress_WEB_HTTPS" = {
    rule_no     = 221
    action      = "allow"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  }
}