VPC_FABRIC      = "10.15.0.0/16"
VPC_OPEN_CIDR   = "0.0.0.0/0"
VPC_WEB_SUBNETS = "10.15.175.0/24"
VPC_DB_SUBNETS  = "10.15.176.0/24"

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