
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

variable "central_outbound_subnet_ids" {
}

variable "central_outbound_vpc_id" {
}

variable "transit_gateway_id" {
}

variable "enable_default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table"
  type        = bool
  default     = false
}

variable "enable_default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table"
  type        = bool
  default     = false
}



