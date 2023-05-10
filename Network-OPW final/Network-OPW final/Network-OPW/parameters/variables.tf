variable "organization" {
  type = string
  default = "COMPANY"
}

variable "component" {
  type = string  
  default = "network-infra"
}

variable "reg_short" {
  default = "opw"
}

variable "az_short" {
  type = list
  default = ["opw", "opw","opw"]
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b","ap-southeast-1c"]
  type = list 
  description = "List of availability zones"  
}
variable "ami" {
  type     = list(string)
  default  = []
}


variable "vpc_security_group_ids" {
  type     = list(string)
  default  = []
}
variable "instance_type" {
  type     = list(string)
  default  = []
}
variable "subnet_id" {
  type     = list(string)
  default  = []
}
variable "key_name" {
  type     = list(string)
  default  = []
}
variable "instance_name" {
  type     = list(string)
  default  = []
}

variable "name" {
  type     = list(string)
  default  = []
}

variable "project_name" {
   type     = list(string)
  default  = []
}
variable "nlb_security_group_id" {
   type     = list(string)
  default  = []
}
variable "private-ec2-subnet_id" {
   type     = list(string)
  default  = []
}
variable "vpc_id" {
   type     = list(string)
  default  = []
}
variable "identifier" {
   type     = list(string)
  default  = []
}

# variable "vpc_security_group_ids" {
#    type     = list(string)
#   default  = []
# }
# # variable "private_instance_count" {
# #    type     = list(string)
# #   default  = []
# }







