##########################################################################################
# Create  RouteTable, RouteAssociation
##########################################################################################

#--------------------------------------------------------------------------------------#
# Public Workload route table. This is a internet access and local access
resource "aws_route_table" "public-dmz-rtb" {
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
  #count   = length(var.public-cidr)
  vpc_id  = aws_vpc.workload-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  dynamic "route" {
    for_each = toset(var.tgw-route-cidr)
      content {
       # Route via VPC Transit Gateway
         cidr_block = route.value
         gateway_id = var.transit_gateway_id     
      }
   }
  tags = {
    Name = "${var.project_name}-${var.env}-public-dmz-${var.reg_short}-rtb",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "route-table",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  } 
}
# One route-table is associated to 3 subnet
resource "aws_route_table_association" "public-dmz" {
  count          = length(var.public-dmz-cidr)
  subnet_id      = aws_subnet.public-dmz-subnet[count.index].id
  route_table_id = aws_route_table.public-dmz-rtb.id
}

#--------------------------------------------------------------------------------------#

# # ecs-control-plane route table. This is a no-internet access, only local access
# resource "aws_route_table" "ecs-control-plane-rtb" {
#   # count = length(var.eks-control-plane-cidr)
#   depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
#   vpc_id = aws_vpc.workload-vpc.id
#   # default route to TGW
#   # route {
#   #   cidr_block = "0.0.0.0/0"
#   #   gateway_id = var.transit_gateway_id
#   #   # nat_gateway_id = aws_nat_gateway.NGW[random_interger.length(var.number_of_natgw)]result.id
#   # }
#   # Static Local route to TGW. EKS Control-Plan subnet may not need the route
#   dynamic "route" {
#     for_each = toset(var.tgw-route-cidr)
#       content {
#        # Route via VPC Transit Gateway
#          cidr_block = route.value
#          gateway_id = var.transit_gateway_id     
#       }
#    }
#   tags = {
#     Name = "${var.project_name}-${var.env}-ecs-control-plane-${var.reg_short}-rtb",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "route-table",
#     "component" = var.component,
#     "team" = var.team,
#     "owner"= var.owner,
#     "iac" = var.iac,
#     "site" = var.site,
#     "canbedelete" = var.canbedelete
#   }  
# }
# # One route-table is associated to 3 subnet
# resource "aws_route_table_association" "ecs-control-plane" {
#   count          = length(var.ecs-control-plane-cidr)
#   subnet_id      = aws_subnet.ecs-control-plane-subnet[count.index].id
#   route_table_id = aws_route_table.ecs-control-plane-rtb.id
# }

#--------------------------------------------------------------------------------------#

# # application route table. This is a internet access and local access
# resource "aws_route_table" "application-rtb" {
#   depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
#   # count = length(var.eks-workload-cidr)
#   vpc_id = aws_vpc.workload-vpc.id
#   # default route to TGW
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = var.transit_gateway_id
#     # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
#   }
#   tags = {
#     Name = "${var.project_name}-${var.env}-application-${var.reg_short}-rtb",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "route-table",
#     "component" = var.component,
#     "team" = var.team,
#     "owner"= var.owner,
#     "iac" = var.iac,
#     "site" = var.site,
#     "canbedelete" = var.canbedelete
#   }  
# }

# # One route-table is associated to 3 subnet
# resource "aws_route_table_association" "application" {
#   count          = length(var.application-cidr)
#   subnet_id      = aws_subnet.application-subnet[count.index].id
#   route_table_id = aws_route_table.application-rtb.id
# }

#--------------------------------------------------------------------------------------#

# private-ec2 route table. This is a internet access and local access
resource "aws_route_table" "private-back-office-subnet" {
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
  # count = length(var.private-ec2-cidr)
  vpc_id = aws_vpc.workload-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = var.transit_gateway_id
    # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
  }
  tags = {
    Name = "${var.project_name}-${var.env}-private-back-office-subnet-${var.reg_short}-rtb",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "route-table",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }  
}
# One route-table is associated to 3 subnet
resource "aws_route_table_association" "private-back-office-subnet" {
  count          = length(var.private-ec2-cidr)
  subnet_id      = aws_subnet.private-back-office-subnet[count.index].id
  route_table_id = aws_route_table.private-back-office-subnet.id
}


#--------------------------------------------------------------------------------------#

# private-ec2-01 route table. This is a internet access and local access
resource "aws_route_table" "private-ec2-subnet" {
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
  # count = length(var.private-ec2-01-cidr)
  vpc_id = aws_vpc.workload-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = var.transit_gateway_id
    # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
  }
  tags = {
    Name = "${var.project_name}-${var.env}-private-ec2-subnet-${var.reg_short}-rtb",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "route-table",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }  
}
# One route-table is associated to 3 subnet
resource "aws_route_table_association" "private-ec2-subnet" {
  count          = length(var.private-ec2-cidr)
  subnet_id      = aws_subnet.private-ec2-subnet[count.index].id
  route_table_id = aws_route_table.private-ec2-subnet.id
}


#--------------------------------------------------------------------------------------#

# EC2 workload route table. This is a internet access and local access
resource "aws_route_table" "private-application-subnet" {
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
  # count = length(var.private-ec2-02-cidr)
  vpc_id = aws_vpc.workload-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = var.transit_gateway_id
    # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
  }
  tags = {
    Name = "${var.project_name}-${var.env}-private-application-subnet-${var.reg_short}-rtb",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "route-table",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }  
}
# One route-table is associated to 3 subnet
resource "aws_route_table_association" "private-application-subnet" {
  count          = length(var.private-application-cidr)
  subnet_id      = aws_subnet.private-application-subnet[count.index].id
  route_table_id = aws_route_table.private-application-subnet.id
}

#--------------------------------------------------------------------------------------#

# database route table. This is a no-internet access, only local access
resource "aws_route_table" "database-rtb" {
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
  # count = length(var.database-cidr)
  vpc_id = aws_vpc.workload-vpc.id
  # default route to TGW
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.IGW.id
  #   # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
  # }
  # Static Local route to TGW. EKS Control-Plan subnet may not need the route
  dynamic "route" {
    for_each = toset(var.tgw-route-cidr)
      content {
       # Route via VPC Transit Gateway
         cidr_block = route.value
         gateway_id = var.transit_gateway_id     
      }
   }
  tags = {
    Name = "${var.project_name}-${var.env}-database-${var.reg_short}-rtb",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "route-table",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }  
}
# One route-table is associated to 3 subnet
resource "aws_route_table_association" "database" {
  count = length(var.database-cidr)
  subnet_id      = aws_subnet.database-subnet[count.index].id
  route_table_id = aws_route_table.database-rtb.id
}

#--------------------------------------------------------------------------------------#

# tgw attachment route table. This is a internet access and local access
resource "aws_route_table" "tgw-attachment-rtb" {
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.TGW-atta]
  # count = length(var.tgw-attachment-cidr)
  vpc_id = aws_vpc.workload-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.transit_gateway_id
    # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
  }
  tags = {
    Name = "${var.project_name}-${var.env}-tgw-attachment-${var.reg_short}-rtb",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "route-table",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }  
}
# One route-table is associated to 3 subnet
resource "aws_route_table_association" "tgw-attachment" {
  count = length(var.tgw-attachment-cidr)
  subnet_id      = aws_subnet.tgw-attachment-subnet[count.index].id
  route_table_id = aws_route_table.tgw-attachment-rtb.id
}

#--------------------------------------------------------------------------------------#
