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