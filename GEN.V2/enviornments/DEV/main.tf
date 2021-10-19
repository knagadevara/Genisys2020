
module "Xapp-VPC" {
  source = "../../modules/vpc"
  VPC_FABRIC      = terraform.workspace=="DEV" ? "10.15.0.0/16" : ""
  VPC_OPEN_CIDR   = terraform.workspace=="DEV" ? "0.0.0.0/0" : ""
  VPC_WEB_SUBNETS = terraform.workspace=="DEV" ? "10.15.175.0/24" : ""
  VPC_DB_SUBNETS  = terraform.workspace=="DEV" ? "10.15.176.0/24" : ""

NACL_EGRESS_ROUTE_RULES = terraform.workspace=="DEV" ? {
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
} : {}

NACL_INRESS_ROUTE_RULES = terraform.workspace=="DEV" ? {
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
} : {}

}
# module "Xapp-IAM" {
#   source = "../../modules/iam"
#   IAM_UserFilePath = "../../files/SAdminUsers.csv"
#   ## For some odd fucking reason this is not working instead a full path is working.
# }


module "Xapp-SG" {
  source = "../../modules/secgrp"
WEB_PORTS_PUBLIC_MAP_INGRESS = terraform.workspace=="DEV" ? {
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
} : {}

WEB_PORTS_PUBLIC_MAP_EGRESS = terraform.workspace=="DEV" ? {
  "WEB_N" = {
    protocol    = "tcp",
    from_port   = 0,
    to_port     = 65535,
    cidr_blocks = ["10.15.175.0/24", "10.15.176.0/24"],
    description = "All ports Outbound Access only to internal subnet to restrict cross scripting"
  },

  "WEB_H" = {
    protocol    = "udp",
    from_port   = 0,
    to_port     = 65535,
    cidr_blocks = ["10.15.175.0/24", "10.15.176.0/24"],
    description = "All ports Outbound Access only to internal subnet to restrict cross scripting"
  }}  : {}
}


module "Xapp-S3" {
  source = "../../modules/storage_s3"
}

module "Xapp-EC2-WEBServer" {
  source = "../../modules/ec2"
  AWS_VIRT_TYP     = "hvm"
  Xapp_SET = terraform.workspace=="DEV" ? lookup(var.xaap_enviornmant, terraform.workspace).Xapp_SET : 0 
  Xapp_SHAPE = terraform.workspace=="DEV" ? lookup(var.xaap_enviornmant, terraform.workspace).Xapp_SHAPE : "t3.micro"
}

variable "xaap_enviornmant" {
  type = map(object({
    Xapp_SHAPE = string
    Xapp_SET   = number
  }))
default = {
    "DEV" = {
      Xapp_SET = 2
      Xapp_SHAPE = "t3.micro"
    }
}
}
