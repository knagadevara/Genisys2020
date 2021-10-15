
resource "aws_iam_user" "Xapp_SYS_ADMIN" {
  name = var.Xapp_SYS_ADMIN[count.index]
  count = length(var.Xapp_SYS_ADMIN)
  path = "/system/"

}

output "UserCount" {
    value = length(var.Xapp_SYS_ADMIN)
}

