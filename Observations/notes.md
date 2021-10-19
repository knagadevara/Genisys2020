terraform
- plan -out <"PATH to save the binary">
- apply <"Path to last successfull plan.">
- taint <"resource name">
- refresh
- output <"output variable  name">
- workspace -h

        # apparently Source is not found
        # filter {
        #   name   = "Source"
        #   values = ["099720109477/ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-2021*"]
        # }

        ##  "for_each" is not expected here. "iterator" is not expected here.
        # for_each = var.aws_security_group.web-httpd-rule.ingress
        # iterator = sgr
        # value = sgr.value.from_port
        # below works but the output is unintelligible
        # value = format("PORT's: %v - %v, DESC: %v ", aws_security_group.web-httpd-rule.ingress[*].from_port , aws_security_group.web-httpd-rule.ingress[*].to_port , aws_security_group.web-httpd-rule.ingress[*].description)

        ####
        # Variable usage from command-line
        #$ terraform <> -var="variable_name=variable_value"
        # or
        #$ terraform <> -var-file="/path/to/var/file.tfvars"
        # or
        #$ export TF_VAR_<variable_name> <variable_value>
        # variable "WEB_PORTS_PUB" {
        #   type = list(number)
        # }
        # variable "WEB_APP_SUBNETS" {
        #   type = list(string)
        # }
        ####
        
        # IAM_UserFilePath = "${path.module}/SAdminUsers.csv" ## cannnot use variable reference in the terraform.auto.tfvars
        # UserMap = { AWS_IAM_SADMIN = { users = [ 
        #     "batman"  ,
        #     "superman" , 
        #     "wolferine" , 
        #     "sandman" ] } }        