module "vpc-mimic-non-prod" {
  source = "../templates/network/mimic-non-network"
  project_name                        = "mimic"
  env                                 = "non-prod"
  organization                        = var.organization
  component                           = var.component
  team                                = "devops"
  owner                               = "sa"
  iac                                 = "true"
  site                                = "primary"
  canbedelete                         = "no"
  vpc_cidr                            = "10.5.0.0/16"
  #eks-control-plane-cidr             = ["10.3.1.0/24", "10.3.2.0/24", "10.3.3.0/24"]
  #eks-workload-cidr                  = ["10.3.128.0/19", "10.3.160.0/19", "10.3.192.0/19"]
  #database-cidr                      = ["10.3.4.0/24", "10.3.5.0/24", "10.3.6.0/24"]
  private-cidr                        = ["10.5.10.0/24", "10.5.11.0/24", "10.5.12.0/24"]
  public-cidr                         = ["10.5.7.0/24", "10.5.8.0/24", "10.5.9.0/24"]
  tgw-attachment-cidr                 = ["10.5.13.0/28", "10.5.13.16/28", "10.5.13.32/28"]
  tgw-route-cidr                      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  availability_zones                  = var.availability_zones
  reg_short                           = var.reg_short
  az_short                            = var.az_short
  transit_gateway_id                  = module.transit-gateway.tgw-identifier
  transit_gateway                     = module.transit-gateway.tgw
  transit_gateway-cen-outb-rtb-id     = module.transit-gateway.central-outbound-tgw-attachment-rtb-id
  transit_gateway-cen-outb-atta-id    = module.transit-gateway.central-outbound-tgw-attachment-id
}
module "ec2_instance_non-minic" {
  source = "../templates/network/ec2-instance-mimic"
  project_name                  = "mimic"
  env                           = "non-prod"
  organization                  = var.organization
  component                     = var.component
  team                          = "sre-ops"
  owner                         = "sa"
  iac                           = "true"
  site                          = "primary"
  canbedelete                   = "no"
  ami                           = "ami-0a72af05d27b49ccb"
  instance_type                 = "t2.micro"
  key_name                      = "tungopenwaygroup"
  vpc_security_group_ids        = module.vpc-mimic-non-prod.mimic-non-prod-id
  subnet_id                     = module.vpc-mimic-non-prod.public-subnet_id[0]
  }
