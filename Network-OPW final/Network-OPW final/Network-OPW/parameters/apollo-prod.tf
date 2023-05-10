module "vpc-apollo-prod" {
  source = "../templates/network/workload-apollo-prod-network"
  project_name                        = "apollo"
  env                                 = "prod"
  organization                        = var.organization
  component                           = var.component
  team                                = "devops"
  owner                               = "sa"
  iac                                 = "true"
  site                                = "primary"
  canbedelete                         = "no"
  vpc_cidr                            = "10.3.0.0/16"
  ecs-control-plane-cidr              = ["10.3.1.0/24", "10.3.2.0/24", "10.3.3.0/24"]
  application-cidr                    = ["10.3.128.0/19", "10.3.160.0/19", "10.3.192.0/19"]
  database-cidr                       = ["10.3.4.0/24", "10.3.5.0/24", "10.3.6.0/24"]
  API-service-GraphQL-cidr            = ["10.3.14.0/24", "10.3.15.0/24", "10.3.16.0/24"]
  service-cidr                        = ["10.3.10.0/24", "10.3.11.0/24","10.3.12.0/24"]
  public-cidr                         = ["10.3.7.0/24", "10.3.8.0/24", "10.3.9.0/24"]
  tgw-attachment-cidr                 = ["10.3.13.0/28", "10.3.13.16/28", "10.3.13.32/28"]
  tgw-route-cidr                      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  availability_zones                  = var.availability_zones
  reg_short                           = var.reg_short
  az_short                            = var.az_short
  transit_gateway_id                  = module.transit-gateway.tgw-identifier
  transit_gateway                     = module.transit-gateway.tgw
  transit_gateway-cen-outb-rtb-id     = module.transit-gateway.central-outbound-tgw-attachment-rtb-id
  transit_gateway-cen-outb-atta-id    = module.transit-gateway.central-outbound-tgw-attachment-id
}

module "database" {
  source = "../templates/network/database"
  identifier               = var.identifier
  instance_type            = "db.t2.micro"
  engine_version           = "8.0"
  storage_size             = "100"
  db_name                  = "mydatabase"
  username                 = "admin"
  password                 = "admin123456"
  port                     = "3306"   
  multi_az                 = true
  publicly_accessible      = false
  vpc_security_group_ids       = [module.vpc-apollo-prod.apollo-prod-database-ids]
  
}