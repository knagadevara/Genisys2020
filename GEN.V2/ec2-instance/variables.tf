
variable "AWS_VIRT_TYP" {
  type = string
}

variable "AMI_ID" {
  type = string
  validation {
    condition     = length(var.AMI_ID) > 4 && substr(var.AMI_ID, 0, 4) == "ami-"
    error_message = "Amazon AMI id should start with ami-."
  }
}
variable "AZ_US_EST1" {
  type = string
}
variable "AZ_US_EST2" {
  type = string
}

variable "Xapp_SYS_ADMIN" {
  type = list(string)
}

variable "Xapp_ENVIRONMENT_TYPE" {
  type = string
  validation {
    condition = (length(var.Xapp_ENVIRONMENT_TYPE) == 3 && (substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "PRD" || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "DEV"
    || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "TST" || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "STG"))
    error_message = "Provided value is not part of the acceptable values, please check the deployment guide."
  }
}

variable "PRD_Xapp_SET" {
  type = number
}

variable "DEV_Xapp_SET" {
  type = number
}

variable "TST_Xapp_SET" {
  type = number
}

variable "STG_Xapp_SET" {
  type = number
}

variable "DEV_Xapp_SHAPE" {
  type = string
}

variable "TST_Xapp_SHAPE" {
  type = string
}

variable "STG_Xapp_SHAPE" {
  type = string
}

variable "PRD_Xapp_SHAPE" {
  type = string
}

variable "IAM_UserFilePath" {
  type = string
}

variable "IAM_ALtUsrPath" {
  type = string
}

variable "VPC_FABRIC" {
  type = string
}

variable "VPC_WEB_SUBNETS" {
  type = string
}

variable "VPC_DB_SUBNETS" {
  type = string
}

variable "VPC_OPEN_CIDR" {
  type = string

}

variable "WEB_PORTS_PUBLIC_MAP" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "NACL_EGRESS_ROUTE_RULES" {
  type = map(object({
    rule_no     = number
    action      = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  }))
}

variable "NACL_INRESS_ROUTE_RULES" {
  type = map(object({
    rule_no     = number
    action      = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  }))
}