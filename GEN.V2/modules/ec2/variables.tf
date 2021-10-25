variable "AWS_VIRT_TYP" {
  type = string
}

variable "Xapp_SHAPE" {
  type = string
}

variable "Xapp_SET" {
  type = string
}

# variable "AMI_ID" {
#   type = string
#   validation {
#     condition     = length(var.AMI_ID) > 4 && substr(var.AMI_ID, 0, 4) == "ami-"
#     error_message = "Amazon AMI id should start with ami-."
#   }

# }
