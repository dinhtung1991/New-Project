
########################## Varibles for Project  ###########################
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

########################## Variables for Resource tags  ###########################

variable "team" {
  default = "sre-ops"
}

variable "owner" {
  default = "tungnd"
}

variable "iac" {
  default = "true"
}

variable "site" {
  default = "secondary"
}

variable "canbedelete" {
  type = string
  default = "no"
}

variable "project_name" {
}

variable "organization" {
}

variable "env" {
}

variable "component" {
}

########################## Resource variables ###########################

variable "ami" {
  description = "AMI ID"
}

variable "instance_type" {
  description = "Instance type"
}

variable "key_name" {
  description = "SSH key name"
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be launched"
}


variable "vpc_security_group_ids" {
  description = "Name tag"
}



