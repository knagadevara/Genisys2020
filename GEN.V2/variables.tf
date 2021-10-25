# variable "Xapp_ENVIRONMENT_TYPE" {
#   type = string
#   validation {
#     condition = (length(var.Xapp_ENVIRONMENT_TYPE) == 3 && (substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "PRD" || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "DEV"
#     || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "TST" || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "STG"))
#     error_message = "Provided value is not part of the acceptable values, please check the deployment guide."
#   }
# }




variable "AZ_US_EST1" {
  type = string
}


variable "AZ_US_EST2" {
  type = string
}

