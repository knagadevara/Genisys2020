resource "aws_security_group" "web-httpd-rule" {
  name = "web-httpd-rule"

  dynamic "egress" {
    for_each = var.WEB_PORTS_PUBLIC_MAP_EGRESS
    iterator = sgr
    content {
      from_port   = sgr.value.from_port
      to_port     = sgr.value.to_port
      protocol    = sgr.value.protocol
      cidr_blocks = sgr.value.cidr_blocks
      description = sgr.value.description
    }
  }

  dynamic "ingress" {
    for_each = var.WEB_PORTS_PUBLIC_MAP_INGRESS
    iterator = sgr
    content {
      from_port   = sgr.value.from_port
      to_port     = sgr.value.to_port
      protocol    = sgr.value.protocol
      cidr_blocks = sgr.value.cidr_blocks
      description = sgr.value.description
    }
  }
}

output "Port_Description" {
  value = [aws_security_group.web-httpd-rule.ingress[*].from_port, aws_security_group.web-httpd-rule.ingress[*].to_port]
}