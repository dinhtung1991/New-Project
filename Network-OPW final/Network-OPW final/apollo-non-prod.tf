module "vpc-apollo-non-prod" {
  source = "../templates/network/workload-apollo-non-network"
  project_name                        = "apollo"
  env                                 = "non-prod"
  organization                        = var.organization
  component                           = var.component
  team                                = "devops"
  owner                               = "sa"
  iac                                 = "true"
  site                                = "primary"
  canbedelete                         = "no"
  vpc_cidr                            = "10.2.0.0/16"
  ecs-control-plane-cidr              = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  # eks-workload
  application-cidr                    = ["10.2.128.0/19", "10.2.160.0/19", "10.2.192.0/19"]
  database-cidr                       = ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"]
  # private-ec2
  service-cidr                        = ["10.2.10.0/24", "10.2.11.0/24", "10.2.12.0/24"]
  # private-ec2-01
  API-service-GraphQL-cidr            = ["10.2.16.0/24", "10.2.14.0/24", "10.2.15.0/24"]
  public-cidr                         = ["10.2.7.0/24", "10.2.8.0/24", "10.2.9.0/24"]
  tgw-attachment-cidr                 = ["10.2.13.0/28", "10.2.13.16/28", "10.2.13.32/28"]
  tgw-route-cidr                      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  availability_zones                  = var.availability_zones
  reg_short                           = var.reg_short
  az_short                            = var.az_short
  transit_gateway_id                  = module.transit-gateway.tgw-identifier
  transit_gateway                     = module.transit-gateway.tgw
  transit_gateway-cen-outb-rtb-id     = module.transit-gateway.central-outbound-tgw-attachment-rtb-id
  transit_gateway-cen-outb-atta-id    = module.transit-gateway.central-outbound-tgw-attachment-id
}