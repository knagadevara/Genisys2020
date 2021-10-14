resource "aws_iam_user" "Xapp_SYS_ADMIN" {
  name = var.Xapp_SYS_ADMIN[count.index]
  count = length(var.Xapp_SYS_ADMIN)
  path = "/sys/"
}

output "UserCount" {
    value = length(var.Xapp_SYS_ADMIN)
}