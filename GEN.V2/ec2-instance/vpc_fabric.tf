
locals {
  min_tag = {
    "Name"             = "vdc2_vpc"
    "VDC"              = "2"
    "TerraformManaged" = true
    "Application"      = "Xandora"
  }
}

resource "aws_vpc" "vdc2_main_vpc" {
  cidr_block       = var.VPC_FABRIC
  instance_tenancy = "default"
  tags             = local.min_tag
}

resource "aws_internet_gateway" "vdc2_main_gw" {
  vpc_id = aws_vpc.vdc2_main_vpc.id
  tags   = local.min_tag
}

resource "aws_subnet" "vdc2_main_subnet_private_DB" {
  vpc_id                  = aws_vpc.vdc2_main_vpc.id
  cidr_block              = var.VPC_DB_SUBNETS
  map_public_ip_on_launch = false
  tags                    = local.min_tag
}

resource "aws_subnet" "vdc2_main_subnet_public_WEB" {
  vpc_id                  = aws_vpc.vdc2_main_vpc.id
  cidr_block              = var.VPC_WEB_SUBNETS
  map_public_ip_on_launch = false
  tags                    = local.min_tag
}

resource "aws_route_table" "vdc2_main_rt" {
  vpc_id = aws_vpc.vdc2_main_vpc.id
  tags   = local.min_tag
}

resource "aws_route" "vdc2_default_route_out" {
  route_table_id         = aws_route_table.vdc2_main_rt.id
  destination_cidr_block = var.VPC_OPEN_CIDR
  gateway_id             = aws_internet_gateway.vdc2_main_gw.id
}

resource "aws_route_table_association" "vdc2_sub_route_association_WEB" {
  subnet_id      = aws_subnet.vdc2_main_subnet_public_WEB.id
  route_table_id = aws_route_table.vdc2_main_rt.id
}

resource "aws_main_route_table_association" "vdc2_vpc_route_association_MAIN" {
  vpc_id         = aws_vpc.vdc2_main_vpc.id
  route_table_id = aws_route_table.vdc2_main_rt.id
}

resource "aws_network_acl" "vdc2_vpc_nacl" {
  vpc_id = aws_vpc.vdc2_main_vpc.id

  dynamic "egress" {
    for_each = var.NACL_EGRESS_ROUTE_RULES
    iterator = nacl
    content {
      protocol   = nacl.value.protocol
      rule_no    = nacl.value.rule_no
      action     = nacl.value.action
      cidr_block = nacl.value.cidr_blocks
      from_port  = nacl.value.from_port
      to_port    = nacl.value.to_port
    }
  }

  dynamic "ingress" {
    for_each = var.NACL_INRESS_ROUTE_RULES
    iterator = nacl
    content {
      protocol   = nacl.value.protocol
      rule_no    = nacl.value.rule_no
      action     = nacl.value.action
      cidr_block = nacl.value.cidr_blocks
      from_port  = nacl.value.from_port
      to_port    = nacl.value.to_port
    }
  }

  tags = local.min_tag
}
