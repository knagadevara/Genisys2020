variable "Xapp_ENVIRONMENT_TYPE" {
  type = string
  validation {
    condition = (length(var.Xapp_ENVIRONMENT_TYPE) == 3 && (substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "PRD" || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "DEV"
    || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "TST" || substr(var.Xapp_ENVIRONMENT_TYPE, 0, 3) == "STG"))
    error_message = "Provided value is not part of the acceptable values, please check the deployment guide."
  }
}

variable "AMI_ID" {
  type = string
  validation {
    condition     = length(var.AMI_ID) > 4 && substr(var.AMI_ID, 0, 4) == "ami-"
    error_message = "Amazon AMI id should start with ami-."
  }
}

variable "AZ_US_EST1" {
  type = string
}
variable "AZ_US_EST2" {
  type = string
}