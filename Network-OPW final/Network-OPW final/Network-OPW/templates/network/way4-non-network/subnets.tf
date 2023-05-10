##########################################################################################
# We create 3 public subnets, 3 databases subnets, 3 EKS Control Plane Subnet subnets, 
# 3 EKS Private Workload Subnet Subnets, 3 Other Workload Subnets.
##########################################################################################

# 3 Public Common network subnets: 
# If Custommer use central inbound vpc, ignore this subnet
resource "aws_subnet" "public-dmz-subnet" {
  count             = length(var.public-dmz-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.public-dmz-cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-public-dmz-${var.az_short[count.index]}-subnet",
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



# # 3 Private ecs-control-plane subnets: 
# resource "aws_subnet" "ecs-control-plane-subnet" {
#   count             = length(var.ecs-control-plane-cidr)
#   vpc_id            = aws_vpc.workload-vpc.id
#   cidr_block        = var.ecs-control-plane-cidr[count.index]
#   availability_zone = var.availability_zones[count.index]
#   tags = {
#     Name = "${var.project_name}-${var.env}-ecs-control-plane-${var.az_short[count.index]}-subnet",
#     "kubernetes.io/cluster/${var.project_name}-${var.env}-eks-cluster" = "shared",
#     "kubernetes.io/role/internal-elb" = "1",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "subnet",
#     "component" = var.component,
#     "team" = var.team,
#     "owner"= var.owner,
#     "iac" = var.iac,
#     "site" = var.site,
#     "canbedelete" = var.canbedelete
#   }
# }

# # 3 Private application subnets: 
# resource "aws_subnet" "application-subnet" {
#   count             = length(var.application-cidr)
#   vpc_id            = aws_vpc.workload-vpc.id
#   cidr_block        = var.application-cidr[count.index]
#   availability_zone = var.availability_zones[count.index]
#   tags = {
#     Name = "${var.project_name}-${var.env}-application-${var.az_short[count.index]}-subnet",
#     "kubernetes.io/cluster/${var.project_name}-${var.env}-eks-cluster" = "shared",
#     "kubernetes.io/role/internal-elb" = "1",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "subnet",
#     "component" = var.component,
#     "team" = var.team,
#     "owner"= var.owner,
#     "iac" = var.iac,
#     "site" = var.site,
#     "canbedelete" = var.canbedelete
#   }
# }




# 3 Private private-ec2 Workload subnets: 
resource "aws_subnet" "private-back-office-subnet" {
  count             = length(var.private-back-office-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.private-back-office-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-private-back-office-${var.az_short[count.index]}-subnet",
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


# 3 Private private-ec2-01 subnets: 
resource "aws_subnet" "private-ec2-subnet" {
  count             = length(var.private-ec2-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.private-ec2-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-private-ec2-${var.az_short[count.index]}-subnet",
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
resource "aws_subnet" "private-application-subnet" {
  count             = length(var.private-application-cidr)
  vpc_id            = aws_vpc.workload-vpc.id
  cidr_block        = var.private-application-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-private-application-${var.az_short[count.index]}-subnet",
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