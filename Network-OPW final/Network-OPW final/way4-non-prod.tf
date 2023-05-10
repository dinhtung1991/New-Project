module "vpc-way-non-prod" {
  source = "../templates/network/way4-non-network"
  project_name                        = "way4"
  env                                 = "non-prod"
  organization                        = var.organization
  component                           = var.component
  team                                = "devops"
  owner                               = "sa"
  iac                                 = "true"
  site                                = "primary"
  canbedelete                         = "no"
  vpc_cidr                            = "10.8.0.0/16"
  #eks-control-plane-cidr             = ["10.22.1.0/24", "10.22.2.0/24", "10.22.3.0/24"]
  database-cidr                       = ["10.8.4.0/24", "10.8.5.0/24",] #"10.7.6.0/24"]
  # public
  public-dmz-cidr                     = ["10.8.7.0/24", "10.8.8.0/24",] #"10.22.9.0/24"]
  # private-ec2
  private-back-office-cidr            = ["10.8.10.0/24", "10.8.11.0/24",] #"10.22.12.0/24"]
  private-ec2-cidr                    = ["10.8.13.0/24", "10.8.14.0/24",] #"10.22.15.0/24"]
  # private-ec2-02
  private-application-cidr            = ["10.8.16.0/24", "10.8.17.0/24",] #"10.22.18.0/24"]
  #eks-workload-cidr                  = ["10.22.128.0/19", "10.22.160.0/19", "10.22.192.0/19"]
  tgw-attachment-cidr                 = ["10.8.20.0/28", "10.8.20.16/28",] #"10.22.20.32/28"]
  tgw-route-cidr                      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  availability_zones                  = var.availability_zones
  reg_short                           = var.reg_short
  az_short                            = var.az_short
  transit_gateway_id                  = module.transit-gateway.tgw-identifier
  transit_gateway                     = module.transit-gateway.tgw
  transit_gateway-cen-outb-rtb-id     = module.transit-gateway.central-outbound-tgw-attachment-rtb-id
  transit_gateway-cen-outb-atta-id    = module.transit-gateway.central-outbound-tgw-attachment-id
}

module "ec2_instance" {
  source = "../templates/network/ec2-instance"
  project_name                  = "3D-Secure ACS"
  env                           = "non"
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
  vpc_security_group_ids        = module.vpc-way-non-prod.way4-non-prod-ws-id
  subnet_id                     = module.vpc-way-non-prod.public-dmz-subnet_id[0]
  }



module "instance" {
  source = "../templates/network/ec2-instance"
  project_name                  = "web-services"
  env                           = "non"
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
  vpc_security_group_ids        = module.vpc-way-non-prod.way4-non-prod-ws-id
  subnet_id                     = module.vpc-way-non-prod.private-back-office-subnet_id[0]
  }
 
module "ec2" {
  source = "../templates/network/ec2-instance"
  project_name                  = "tran-switch"
  env                           = "non"
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
  vpc_security_group_ids        = module.vpc-way-non-prod.way4-non-prod-ts-id
  subnet_id                     = module.vpc-way-non-prod.private-application-subnet_id[0]
  }
    module "fileserver" {
  source = "../templates/network/ec2-instance"
  project_name                  = "fileserver"
  env                           = "non"
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
  vpc_security_group_ids        = module.vpc-way-non-prod.way4-non-prod-fs-id
  subnet_id                     = module.vpc-way-non-prod.private-back-office-subnet_id[0]
  }


  module "database" {
  source = "../templates/network/ec2-instance"
  project_name                  = "database"
  env                           = "non"
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
  vpc_security_group_ids        = module.vpc-way-non-prod.way4-non-prod-db-id
  subnet_id                     = module.vpc-way-non-prod.database-subnet_id[0]
  }