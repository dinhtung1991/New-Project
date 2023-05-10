##########################################################################################
# We create 3 public subnets, 3 natgw subnet, 3 network-firewalls subnets,  3 gwlb-endpoint subnets
# 3 endpoint Subnets, 3 Other Workload Subnets.
##########################################################################################

# 3 Public Common network subnets
resource "aws_subnet" "public-subnet" {
  count             = length(var.public-cidr)
  vpc_id            = aws_vpc.central_outbound_vpc.id
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

# 3 Public Nat-gw subnets
resource "aws_subnet" "natgw-subnet" {
  count             = length(var.natgw-cidr)
  vpc_id            = aws_vpc.central_outbound_vpc.id
  cidr_block        = var.natgw-cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-natgw-${var.az_short[count.index]}-subnet",
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

# 3 Public vpc-endpoint subnets
resource "aws_subnet" "vpc-endpoint-subnet" {
  count             = length(var.vpc-endpoint-cidr)
  vpc_id            = aws_vpc.central_outbound_vpc.id
  cidr_block        = var.vpc-endpoint-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-vpc-endpoint-${var.az_short[count.index]}-subnet",
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

# 3 Public network-firewall subnets
resource "aws_subnet" "network-firewall-subnet" {
  count             = length(var.network-firewall-cidr)
  vpc_id            = aws_vpc.central_outbound_vpc.id
  cidr_block        = var.network-firewall-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-network-firewall-${var.az_short[count.index]}-subnet",
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

# 3 Public gwlb-endpoint for 3rd firewall subnets
resource "aws_subnet" "gwlb-endpoint-subnet" {
  count             = length(var.gwlb-endpoint-cidr)
  vpc_id            = aws_vpc.central_outbound_vpc.id
  cidr_block        = var.gwlb-endpoint-cidr[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.project_name}-${var.env}-gwlb-endpoint-${var.az_short[count.index]}-subnet",
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

# 3 Public tgw-attachment subnets
resource "aws_subnet" "tgw-attachment-subnet" {
  count             = length(var.tgw-attachment-cidr)
  vpc_id            = aws_vpc.central_outbound_vpc.id
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

# resource "aws_subnet" "eks-control-plane-subnet" {
#   # depends_on = [var.transit_gateway]
#   count             = length(var.eks-control-plane-cidr)
#   vpc_id            = aws_vpc.central_outbound_vpc.id
#   cidr_block        = var.eks-control-plane-cidr[count.index]
#   availability_zone = var.availability_zones[count.index]
#   tags = {
#     Name = "${var.project_name}-${var.env}-eks-control-plane-${var.az_short[count.index]}-subnet",
#     "kubernetes.io/cluster/${var.project_name}-${var.env}-eks-cluster" = "shared",
#     "kubernetes.io/role/internal-elb" = "1",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "subnet",
#     "component" = var.component
#   }
# }

# resource "aws_subnet" "eks-workload-subnet" {
#   # depends_on = [var.transit_gateway]
#   count             = length(var.eks-workload-cidr)
#   vpc_id            = aws_vpc.central_outbound_vpc.id
#   cidr_block        = var.eks-workload-cidr[count.index]
#   availability_zone = var.availability_zones[count.index]
#   tags = {
#     Name = "${var.project_name}-${var.env}-eks-workload-${var.az_short[count.index]}-subnet",
#     "kubernetes.io/cluster/${var.project_name}-${var.env}-eks-cluster" = "shared",
#     "kubernetes.io/role/internal-elb" = "1",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "subnet",
#     "component" = var.component
#   }
# }

# resource "time_sleep" "wait_30_seconds" {
#   depends_on = [null_resource.previous]

#   create_duration = "30s"
# }