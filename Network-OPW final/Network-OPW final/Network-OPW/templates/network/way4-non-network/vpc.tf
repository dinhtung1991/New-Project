resource "aws_vpc" "workload-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "${var.project_name}-${var.env}-${var.reg_short}-vpc",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "vpc",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}


#Create Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.workload-vpc.id
tags = {
  Name = "${var.project_name}-${var.env}-${var.reg_short}-igw",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "internet-gateway",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

