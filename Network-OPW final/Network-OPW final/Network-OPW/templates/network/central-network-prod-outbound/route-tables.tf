##########################################################################################
# Create endpoint RouteTable, RouteAssociation
##########################################################################################

# Create Public Subnet RouteTable, Route, RouteAssociation
resource "aws_route_table" "public-rtb" {
  depends_on = [var.transit_gateway, var.central_outbound_tgw_attachment] 
  vpc_id  = aws_vpc.central_outbound_vpc.id
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
    Name = "${var.project_name}-${var.env}-public-${var.reg_short}-rtb",
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

resource "aws_route_table_association" "public" {
  count          = length(var.public-cidr)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public-rtb.id
}


# Create NatGW RouteTable, Route, RouteAssociation
resource "aws_route_table" "natgw-rtb" {
  # sửa lại nếu dùng firewall
  depends_on = [var.transit_gateway, var.central_outbound_tgw_attachment] 
  count   = length(var.natgw-cidr)
  vpc_id  = aws_vpc.central_outbound_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
    # vpc_endpoint_id = local.endpoint[count.index]
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
    Name = "${var.project_name}-${var.env}-natgw-${var.az_short[count.index]}-rtb",
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

resource "aws_route_table_association" "natgw" {
  count          = length(var.natgw-cidr)
  subnet_id      = aws_subnet.natgw-subnet[count.index].id
  route_table_id = aws_route_table.natgw-rtb[count.index].id
}

# Route table for vpc endpoint attachment subnet
resource "aws_route_table" "vpc-endpoint-rtb" {
  depends_on = [var.transit_gateway, var.central_outbound_tgw_attachment] 
  vpc_id = aws_vpc.central_outbound_vpc.id
  count = length(var.vpc-endpoint-cidr)
  # Static default route
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   //gateway_id = var.transit_gateway_id
  #   gateway_id = aws_internet_gateway.IGW.id
  #   # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
  # }
  # Static local  privated route
  dynamic "route" {
    for_each = toset(var.tgw-route-cidr)
      content {
       # Route via VPC Transit Gateway
         cidr_block = route.value
         gateway_id = var.transit_gateway_id
      }
   }
  tags = {
    Name = "${var.project_name}-${var.env}-vpc-endpoint-${var.reg_short}-${var.az_short[count.index]}-rtb",
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

resource "aws_route_table_association" "vpc-endpoint" {
  count          = length(var.vpc-endpoint-cidr)
  subnet_id      = aws_subnet.vpc-endpoint-subnet[count.index].id
  route_table_id = aws_route_table.vpc-endpoint-rtb[count.index].id
  #route_table_id = aws_route_table.vpc-endpoint-rtb.id
}

# Create network-firewall RouteTable, RouteAssociation
resource "aws_route_table" "network-firewall-rtb" {
  count = length(var.network-firewall-cidr)
  depends_on = [aws_nat_gateway.NGW]
  vpc_id = aws_vpc.central_outbound_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NGW[count.index].id
    # Otherway to use count index
    # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
  }
  dynamic "route" {
    for_each = toset(var.tgw-route-cidr)
      content {
       # Route via VPC Transit Gateway
         cidr_block = route.value
         gateway_id = var.transit_gateway_id     
      }
   }
  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.IGW.id
  # }
  tags = {
    Name = "${var.project_name}-${var.env}-network-firewall-${var.az_short[count.index]}-rtb",
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

resource "aws_route_table_association" "network-firewall" {
  count = length(var.network-firewall-cidr)
  subnet_id      = aws_subnet.network-firewall-subnet[count.index].id
  route_table_id = aws_route_table.network-firewall-rtb[count.index].id
}


# Create tgw-attachment RouteTable, RouteAssociation
resource "aws_route_table" "tgw-attachment-rtb" {
  # chỉnh sử lại nếu dung firewall
  # depends_on = [var.transit_gateway,aws_ec2_transit_gateway_vpc_attachment.tgw-atta, aws_networkfirewall_firewall.NFW]
  count = length(var.tgw-attachment-cidr)
  vpc_id = aws_vpc.central_outbound_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    # vpc_endpoint_id = local.endpoint[count.index]
    gateway_id = aws_nat_gateway.NGW[count.index].id
    # nat_gateway_id = element(aws_nat_gateway.NGW.*.id,count.index)
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
    Name = "${var.project_name}-${var.env}-tgw-attachment-${var.az_short[count.index]}-rtb",
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

resource "aws_route_table_association" "tgw-attachment" {
  count = length(var.tgw-attachment-cidr)
  subnet_id      = aws_subnet.tgw-attachment-subnet[count.index].id
  route_table_id = aws_route_table.tgw-attachment-rtb[count.index].id
}




# ##################
# # Create NatGW RouteTable, Route, RouteAssociation
# ##################
# resource "aws_route_table" "natgw-rtb" {
#   depends_on = [var.transit_gateway,aws_ec2_transit_gateway_vpc_attachment.tgw-atta]
#   count   = length(var.natgw-cidr)
#   vpc_id  = aws_vpc.central_outbound_vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     # gateway_id = aws_internet_gateway.IGW.id
#     vpc_endpoint_id = local.endpoint[count.index]
#   }
#   dynamic "route" {
#     for_each = toset(var.tgw-route-cidr)
#       content {
#        # Route via VPC Transit Gateway
#          cidr_block = route.value
#          gateway_id = var.transit_gateway_id     
#       }
#    }
#   tags = {
#     Name = "${var.project_name}-${var.env}-natgw-${var.az_short[count.index]}-rtb",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "route-table",
#     "component-role" = var.component-role
#   } 
# }

# resource "aws_route_table_association" "natgw" {
#   count          = length(var.natgw-cidr)
#   subnet_id      = aws_subnet.natgw-subnet[count.index].id
#   route_table_id = aws_route_table.natgw-rtb[count.index].id
# }

# resource "aws_route_table" "igw-rtb" {
#   depends_on = [var.transit_gateway,aws_ec2_transit_gateway_vpc_attachment.tgw-atta]
#   # count   = length(var.network-firewall-cidr)
#   vpc_id  = aws_vpc.central_outbound_vpc.id
#   # dynamic "route" {
#   #   for_each = toset(var.network-firewall-cidr)
#   #     content {
#   #      # Route via VPC Transit Gateway
#   #        cidr_block = route.value
#   #        vpc_endpoint_id = local.endpoint[count.index]     
#   #     }
#   #  }
#   tags = {
#     Name = "${var.project_name}-${var.env}-igw-${var.reg_short}-rtb",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "route-table",
#     "component-role" = var.component-role
#   } 
# }

# resource "aws_route" "igw-route" {
#   count = length(var.network-firewall-cidr)
#   route_table_id = aws_route_table.igw-rtb.id
#   destination_cidr_block = "${element(var.network-firewall-cidr, count.index)}"
#   vpc_endpoint_id =  "${element(local.endpoint, count.index)}"
#   depends_on = [var.transit_gateway,aws_ec2_transit_gateway_vpc_attachment.tgw-atta]
# }

# #####
# #Transit gateway####
# #######
# resource "aws_ec2_transit_gateway_route" "tgw-route" {
#   #count                          = var.number_of_subnets
#   destination_cidr_block         = "0.0.0.0/0"
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-atta.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt.id
# }

# resource "aws_ec2_transit_gateway_route_table" "tgw-rt" {
#   transit_gateway_id = var.transit_gateway_id
#   tags = {
#     Name = "${var.project_name}-${var.env}-${var.reg_short}-tgw-rt",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "tgw route table",
#     "component-role" = var.component-role
#   }
# }

# resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-asso" {
#   #count                          = var.number_of_subnets
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-atta.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt.id
# }

# resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-prop" {
#   #count                          = var.number_of_subnets
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw-atta.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw-rt.id
# }

# resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-atta" {
#   #count              = var.number_of_subnets
#   subnet_ids         = aws_subnet.tgw-attachment-subnet.*.id
#   transit_gateway_id = var.transit_gateway_id
#   transit_gateway_default_route_table_association = "false"
#   transit_gateway_default_route_table_propagation = "false"
#   vpc_id             = aws_vpc.central_outbound_vpc.id
#   tags = {
#     Name = "${var.project_name}-${var.env}-${var.reg_short}-tgw-attachment",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "tgw attachment",
#     "component-role" = var.component-role
#   }
# }