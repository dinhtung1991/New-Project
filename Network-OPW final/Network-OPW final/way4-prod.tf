module "vpc-way-prod" {
  source = "../templates/network/way4-prod-network"
  project_name                        = "way4"
  env                                 = "prod"
  organization                        = var.organization
  component                           = var.component
  team                                = "devops"
  owner                               = "sa"
  iac                                 = "true"
  site                                = "primary"
  canbedelete                         = "no"
  vpc_cidr                            = "10.7.0.0/16"
  #eks-control-plane-cidr             = ["10.22.1.0/24", "10.22.2.0/24", "10.22.3.0/24"]
  database-cidr                       = ["10.7.4.0/24", "10.7.5.0/24",] #"10.7.6.0/24"]
  public-dmz-cidr                     = ["10.7.7.0/24", "10.7.8.0/24",] #"10.22.9.0/24"]
  private-back-office-cidr            = ["10.7.10.0/24", "10.7.11.0/24",] #"10.22.12.0/24"]
  private-ec2-cidr                    = ["10.7.13.0/24", "10.7.14.0/24",] #"10.22.15.0/24"]
  private-application-cidr            = ["10.7.16.0/24", "10.7.17.0/24",] #"10.22.18.0/24"]
  #eks-workload-cidr                  = ["10.22.128.0/19", "10.22.160.0/19", "10.22.192.0/19"]
  tgw-attachment-cidr                 = ["10.7.20.0/28", "10.7.20.16/28",] #"10.22.20.32/28"]
  tgw-route-cidr                      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  availability_zones                  = var.availability_zones
  reg_short                           = var.reg_short
  az_short                            = var.az_short
  transit_gateway_id                  = module.transit-gateway.tgw-identifier
  transit_gateway                     = module.transit-gateway.tgw
  transit_gateway-cen-outb-rtb-id     = module.transit-gateway.central-outbound-tgw-attachment-rtb-id
  transit_gateway-cen-outb-atta-id    = module.transit-gateway.central-outbound-tgw-attachment-id
}

## Create Ec2
module "ec2_instance_01" {
  source = "../templates/network/ec2-instance"
  project_name                  = "3D-Secure ACS"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-ws-id
  subnet_id                     = module.vpc-way-prod.public-dmz-subnet_id[0]
  }
#### Private group
module "instance_01" {
  source = "../templates/network/ec2-instance"
  project_name                  = "web-services_01"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-ws-id
  subnet_id                     = module.vpc-way-prod.private-ec2-subnet_id[0]
  }

  
module "instance_02" {
  source = "../templates/network/ec2-instance"
  project_name                  = "web-services-02"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-ws-id
  subnet_id                     = module.vpc-way-prod.private-ec2-subnet_id[0]
  }

 ## Application EC2 group
module "ec2_01" {
  source = "../templates/network/ec2-instance"
  project_name                  = "tran-switch"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-ts-id
  subnet_id                     = module.vpc-way-prod.private-application-subnet_id[0]
  }
module "ec2_02" {
  source = "../templates/network/ec2-instance"
  project_name                  = "heathy-monitoring"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-ts-id
  subnet_id                     = module.vpc-way-prod.private-application-subnet_id[0]
  }

module "ec2_03" {
  source = "../templates/network/ec2-instance"
  project_name                  = "report-server"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-ts-id
  subnet_id                     = module.vpc-way-prod.private-application-subnet_id[0]
  }

module "ec2_04" {
  source = "../templates/network/ec2-instance"
  project_name                  = "notification"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-ts-id
  subnet_id                     = module.vpc-way-prod.private-application-subnet_id[0]
  }


### Back-Office Group
module "fileserver_01" {
  source = "../templates/network/ec2-instance"
  project_name                  = "fileserver"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-fs-id
  subnet_id                     = module.vpc-way-prod.private-back-office-subnet_id[0]
  }

module "fileserver_02" {
  source = "../templates/network/ec2-instance"
  project_name                  = "scheduler"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-fs-id
  subnet_id                     = module.vpc-way-prod.private-back-office-subnet_id[0]
  }
#### Database Group
module "database_01" {
  source = "../templates/network/ec2-instance"
  project_name                  = "database-master"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-db-id
  subnet_id                     = module.vpc-way-prod.database-subnet_id[0]
  }
module "database_02" {
  source = "../templates/network/ec2-instance"
  project_name                  = "database-standby"
  env                           = "prod"
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
  vpc_security_group_ids        = module.vpc-way-prod.way4-prod-db-id
  subnet_id                     = module.vpc-way-prod.database-subnet_id[0]
  }

 
module "network_load_balancer" {
  source                   = "../templates/network/elb"
  project_name             = "nlb"
  private-ec2-subnet_id    = module.vpc-way-prod.private-ec2-subnet_id[0]  
  vpc_id                   = module.vpc-way-prod.vpc-id
  target_id_01             = module.instance_01.ec2_instance_id
  target_id_02             = module.instance_02.ec2_instance_id
}
