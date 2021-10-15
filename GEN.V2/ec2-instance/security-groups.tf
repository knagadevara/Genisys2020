resource "aws_security_group" "web-httpd-rule" {
  name = "web-httpd-rule"

  dynamic "ingress" {
    for_each = var.WEB_PORTS_PUB
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.WEB_APP_SUBNETS
    }
  }
}