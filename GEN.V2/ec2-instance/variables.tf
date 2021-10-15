####
# Variable usage from command-line
#$ terraform <> -var="variable_name=variable_value"
# or
#$ terraform <> -var-file="/path/to/var/file.tfvars"
# or
#$ export TF_VAR_<variable_name> <variable_value>
####

variable "AMI_ID" {
  type = string
  validation {
    condition = length(var.AMI_ID) > 4 && substr(var.AMI_ID,0,4)=="ami-"
    error_message = "Amazon AMI id should start with ami-."
  }
}
variable "AZ_US_EST1" {
  type    = string
}
variable "AZ_US_EST2" {
  type    = string
}
variable "WEB_APP_SUBNETS" {
  type = list(string)
}

variable "Xapp_SYS_ADMIN" {
  type = list(string)
}

variable "Xapp_ENVIRONMENT_TYPE" {
  type = string
  validation {
    condition=( length(var.Xapp_ENVIRONMENT_TYPE) == 3 && ( substr(var.Xapp_ENVIRONMENT_TYPE,0,3)=="PRD" || substr(var.Xapp_ENVIRONMENT_TYPE,0,3)=="DEV" 
    || substr(var.Xapp_ENVIRONMENT_TYPE,0,3)=="TST" || substr(var.Xapp_ENVIRONMENT_TYPE,0,3)=="STG") )
    error_message = "Provided value is not part of the acceptable values, please check the deployment guide."
  }
}

variable "PRD_Xapp_SET" {
  type = number
}

variable "DEV_Xapp_SET" {
  type = number
}

variable "TST_Xapp_SET" {
  type = number
}

variable "STG_Xapp_SET" {
  type = number
}

variable "DEV_Xapp_SHAPE" {
  type = string
}

variable "TST_Xapp_SHAPE" {
  type = string
}

variable "STG_Xapp_SHAPE" {
  type = string
}

variable "PRD_Xapp_SHAPE" {
  type = string
}

variable "IAM_UserFilePath" {
  type = string
}

variable "IAM_ALtUsrPath" {
  type = string
}
# variable "UserMap" {
#   type = map(object({ users = list(string) }))
#   }
