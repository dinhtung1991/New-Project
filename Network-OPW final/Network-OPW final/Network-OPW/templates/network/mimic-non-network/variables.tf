
########################## Varibles for Project  ###########################
variable "project_name" {
  default = "central-networking" 
}

variable "region" {
  description = "The AWS region to create resources in."
  default = "ap-southeast-1"
}

variable "reg_short" {
  default = "euwe3"
}

variable "availability_zones" {
  default = ["eu-west-3a", "eu-west-3b","eu-west-3c"]
  type        = list
  description = "List of availability zones"  
}

variable "az_short" {
  default = ["euwe3a", "euwe3b","euwe3c"]
  type        = list
  description = "List of az"  
}


########################## Variables for Resource tags  ###########################

variable "env" {
  default = "prod"
}

variable "organization" {
  default = "tungnd"
}

variable "component" {
  default = "network.infra"
}

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
}

# variable "ecs-control-plane-cidr" {
#   type        = list(string)
#   default     = []
# }

# variable "application-cidr" {
#   type        = list(string)
#   default     = []
# }

variable "private-back-office-cidr" {
  type        = list(string)
  default     = []
}

variable "private-cidr" {
  type        = list(string)
  default     = []
}

variable "private-application-cidr" {
  type        = list(string)
  default     = []
}

variable "database-cidr" {
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

variable "tgw-route-cidr" {
  type        = list(string)
  default     = []
}

# TGW var, add more value if customer has central outbound, inbound or inspection vpc
variable "transit_gateway_id" {
  
}
variable "transit_gateway" {
  
}

variable "transit_gateway-cen-outb-atta-id" {
  
}

variable "transit_gateway-cen-outb-rtb-id" {
  
}


# variable "central_outbound_tgw_attachment" {
# }

# variable "workload_dr_prod_subnet_ids" {
# }

# variable "workload_dr_prod_vpc_id" {
# }


