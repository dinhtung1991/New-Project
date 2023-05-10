provider "aws" {
  region = "ap-southeast-1"
  #profile = "torus-central-network-admin"
  # access_key = var.access_key
  # secret_key = var.secret_key
}

module "network-central-network-prod-outbound" {
  source = "../templates/network/central-network-prod-outbound"
  project_name                        = "central-network"
  env                                 = "opw"
  organization                        = var.organization
  component                           = var.component
  team                                = "devops"
  owner                               = "sa"
  iac                                 = "true"
  site                                = "primary"
  canbedelete                         = "no"
  vpc_cidr                            = "10.16.0.0/16"
  public-cidr                         = ["10.16.2.0/24", "10.16.3.0/24", "10.16.4.0/24"]
  natgw-cidr                          = ["10.16.0.0/28", "10.16.0.16/28", "10.16.0.32/28"]
  vpc-endpoint-cidr                   = ["10.16.0.160/27", "10.16.0.192/27", "10.16.0.224/27"]
  network-firewall-cidr               = ["10.16.1.0/28", "10.16.1.16/28", "10.16.1.32/28"]
  gwlb-endpoint-cidr                  = ["10.16.1.48/28", "10.16.1.64/28", "10.16.1.80/28"]
  tgw-attachment-cidr                 = ["10.16.0.48/28", "10.16.0.64/28", "10.16.0.80/28"]
  tgw-route-cidr                      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  availability_zones                  = var.availability_zones
  reg_short                           = var.reg_short
  az_short                            = var.az_short
  number_of_natgw                     = "3"           
  number_of_nfw                       = "3"
  transit_gateway_id                  = module.transit-gateway.tgw-identifier
  transit_gateway                     = module.transit-gateway.tgw
  central_outbound_tgw_attachment     = module.transit-gateway.central-outbound-tgw-attachment-id
}

module "transit-gateway" {
  source = "../templates/network/prod-tgw"
  project_name                        = "central-network"
  env                                 = "opw"
  organization                        = var.organization
  component                           = var.component
  team                                = "sre-ops"
  owner                               = "sa"
  iac                                 = "true"
  site                                = "primary"
  canbedelete                         = "no"
  availability_zones                  = var.availability_zones
  reg_short                           = var.reg_short
  az_short                            = var.az_short
  transit_gateway_id                  = module.transit-gateway.tgw-identifier
  central_outbound_vpc_id             = module.network-central-network-prod-outbound.vpc-id
  central_outbound_subnet_ids         = module.network-central-network-prod-outbound.tgw-attachment-subnet-ids
}

# output "id" {
#   value = module.vpc-share-network.vpce_id
# }

# output "arn" {
#   value = module.vpc-share-network.vpce_arn
# }

# output "endpoint" {
#   value = module.vpc-share-network.vpce_endpoint
# }