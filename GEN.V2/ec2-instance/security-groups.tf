resource "aws_security_group" "web-httpd-rule" {
  name = "web-httpd-rule"

  dynamic "ingress" {
    for_each = var.WEB_PORTS_PUBLIC_MAP
    iterator = sgr
    content {
      from_port   = sgr.value.port
      to_port     = sgr.value.port
      protocol    = sgr.value.protocol
      cidr_blocks = sgr.value.source
      description = sgr.value.description
    }
  }
}