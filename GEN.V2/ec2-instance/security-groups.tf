resource "aws_security_group" "web-httpd-rule" {
  name = "web-httpd-rule"

  egress{
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "OUTBOUND"    
  }

  egress{
      from_port   = 0
      to_port     = 65535
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "OUTBOUND"    
  }

  dynamic "ingress" {
    for_each = var.WEB_PORTS_PUBLIC_MAP
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
  ##  "for_each" is not expected here. "iterator" is not expected here.
  # for_each = var.aws_security_group.web-httpd-rule.ingress
  # iterator = sgr
  # value = sgr.value.from_port
  # below works but the output is unintelligible
  # value = format("PORT's: %v - %v, DESC: %v ", aws_security_group.web-httpd-rule.ingress[*].from_port , aws_security_group.web-httpd-rule.ingress[*].to_port , aws_security_group.web-httpd-rule.ingress[*].description)
  value = [ aws_security_group.web-httpd-rule.ingress[*].from_port , aws_security_group.web-httpd-rule.ingress[*].to_port ]
}