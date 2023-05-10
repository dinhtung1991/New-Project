##########################################################################################
# We create 3 public subnets, 3 databases subnets, 3 EKS Control Plane Subnet subnets, 
# 3 EKS Private Workload Subnet Subnets, 3 Other Workload Subnets.
##########################################################################################

# 3 Public Common network subnets: 
# If Custommer use central inbound vpc, ignore this subnet
resource "aws_subnet" "public-subnet" {
  count             = length(var.public-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.public-cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-public-${var.az_short[count.index]}-subnet",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}



# 3 Private ecs-control-plane subnets: 
resource "aws_subnet" "ecs-control-plane-subnet" {
  count             = length(var.ecs-control-plane-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.ecs-control-plane-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-ecs-control-plane-${var.az_short[count.index]}-subnet",
    "kubernetes.io/cluster/${var.project_name}-${var.env}-eks-cluster" = "shared",
    "kubernetes.io/role/internal-elb" = "1",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# 3 Private application subnets: 
resource "aws_subnet" "application-subnet" {
  count             = length(var.application-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.application-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-application-${var.az_short[count.index]}-subnet",
    "kubernetes.io/cluster/${var.project_name}-${var.env}-eks-cluster" = "shared",
    "kubernetes.io/role/internal-elb" = "1",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}




# 3 Private EC2 Workload subnets: 
resource "aws_subnet" "service-subnet" {
  count             = length(var.service-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.service-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-service-${var.az_short[count.index]}-subnet",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}


# 3 Private EC2 01 Workload subnets: 
resource "aws_subnet" "API-service-GraphQL-subnet" {
  count             = length(var.API-service-GraphQL-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.API-service-GraphQL-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-API-service-GraphQL-${var.az_short[count.index]}-subnet",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}


# 3 Private EC2 02 Workload subnets: 
resource "aws_subnet" "private-ec2-02-subnet" {
  count             = length(var.private-ec2-02-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.private-ec2-02-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-private-ec2-02-${var.az_short[count.index]}-subnet",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}


# 3 Private DataBase  Workload subnets: 
resource "aws_subnet" "database-subnet" {
  count             = length(var.database-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.database-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-database-${var.az_short[count.index]}-subnet",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# 3 Public tgw attachment  subnets: 
resource "aws_subnet" "tgw-attachment-subnet" {
  count             = length(var.tgw-attachment-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.tgw-attachment-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-tgw-attachment-${var.az_short[count.index]}-subnet",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "subnet",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}