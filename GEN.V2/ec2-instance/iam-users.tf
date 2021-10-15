
locals {
  IAM_USERS = fileexists(var.IAM_UserFilePath) ? file(var.IAM_UserFilePath) : file(var.IAM_ALtUsrPath)
  ## The resultants in the condition should be of the same type else an inconsistancy error will be thrown.
  ListOfUsers = csvdecode(local.IAM_USERS)
}

resource "aws_iam_user" "Xapp_SYS_ADMIN" {
  for_each = { for iam_user in local.ListOfUsers: iam_user.AWS_IAM_SADMIN => iam_user }
  name = each.value.AWS_IAM_SADMIN
  # name = var.Xapp_SYS_ADMIN[count.index]
  # count = length(var.Xapp_SYS_ADMIN)
  path = "/system/"

}

# output "UserCount" {
#     # value = length(var.Xapp_SYS_ADMIN)
#     for_each = var.Xapp_SYS_ADMIN
#     value = length(each.value.name)
# }

