resource "aws_security_group" "web-httpd-rule" {
  name = "web-httpd-rule"
  ingress{
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = var.WEB_APP_SUBNETS
  }
  ingress{
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = var.WEB_APP_SUBNETS
  }  
}