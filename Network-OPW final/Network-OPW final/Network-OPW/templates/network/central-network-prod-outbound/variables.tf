
###################### Fixed variables ###########################
variable "tgw-route-cidr" {
  type        = list(string)
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}
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

variable "project_name" {
  default = "central-networking" 
}

variable "env" {
  default = "prod"
}

variable "organization" {
  default = "belletorus"
}

variable "component" {
  default = "network.infra"
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


########################## Variables for Resource Creation  ###########################

variable "vpc_cidr" {
  type        = string
  # default     = "10.4.0.0/16"
}

variable "number_of_natgw" {
  type      =  string
  default   =  "3"      
}

variable "number_of_nfw" {
  type      =  string
  default   =  "1"      
}

variable "vpc-endpoint-cidr" {
  type        = list(string)
  default     = []
}

variable "network-firewall-cidr" {
  type        = list(string)
  default     = []
}

variable "gwlb-endpoint-cidr" {
  type        = list(string)
  default     = []
}

variable "public-cidr" {
  type        = list(string)
  default     = []
}

variable "natgw-cidr" {
  type        = list(string)
  default     = []
}

variable "tgw-attachment-cidr" {
  type        = list(string)
  default     = []
}

variable "transit_gateway_id" {
  
}
variable "transit_gateway" { 
}

variable "central_outbound_tgw_attachment" {
}


# variable "firewall_policy_arn" {
#   default = "arn:aws:network-firewall:us-east-1:871970649861:firewall-policy/torus-network-firewall-policy"
# }

# variable "enable_default_route_table_association" {
#   description = "Whether resource attachments are automatically associated with the default association route table"
#   type        = bool
#   default     = false
# }

# variable "enable_default_route_table_propagation" {
#   description = "Whether resource attachments automatically propagate routes to the default propagation route table"
#   type        = bool
#   default     = false
# }
