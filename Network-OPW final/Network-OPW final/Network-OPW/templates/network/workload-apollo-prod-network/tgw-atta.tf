#----------------------------Workload TGW Attachment------------------------------

#Create Transit Gateway attachment at central outbound vpc
resource "aws_ec2_transit_gateway_vpc_attachment" "TGW-atta" {
  subnet_ids         = aws_subnet.tgw-attachment-subnet.*.id
  transit_gateway_id = var.transit_gateway_id
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"
  vpc_id             = aws_vpc.workload-vpc.id
  tags = {
    Name = "${var.project_name}-${var.env}-vpc-tgw-attachment"
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "vpc-tgw-attachment",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}
#----------------------------Workload TGW Routetable------------------------------

# Part 1: Fixed entry route-table
#Create Transit Gateway attachment RTB and asssociate to itself at workload dr prod attachment
resource "aws_ec2_transit_gateway_route_table" "TGW-atta-rt" {
  transit_gateway_id = var.transit_gateway_id
  tags = {
    Name = "${var.project_name}-${var.env}-vpc-tgw-attachment-rtb"
  }
}
resource "aws_ec2_transit_gateway_route_table_association" "TGW-rt-asso" {
  #count                          = var.number_of_subnets
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGW-atta.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW-atta-rt.id
}

# Static route 0.0.0.0/0 for TGW attachment workload route-table to central outbound TGW attachment
resource "aws_ec2_transit_gateway_route" "TGW-route" {
  #count                          = var.number_of_subnets
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = var.transit_gateway-cen-outb-atta-id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW-atta-rt.id
}

# Dynamic for TGW attachment workload route-table to its self
resource "aws_ec2_transit_gateway_route_table_propagation" "TGW-rt-prop" {
  #count                          = var.number_of_subnets
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGW-atta.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW-atta-rt.id
}

# Part 2: Dynamic entry route-table, You need to add more value if customer has central outbound, inbound or inspection vpc

# Part 2.1: Dynamic for TGW attachment workload route-table to central outbound TGW attachment
resource "aws_ec2_transit_gateway_route_table_propagation" "TGW-to-cen-out-rt-prop" {
  #count                          = var.number_of_subnets
  transit_gateway_attachment_id  = var.transit_gateway-cen-outb-atta-id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW-atta-rt.id
}

# Part 2.2: Dynamic for TGW attachment workload route-table to central inbound TGW attachment


# Part 2.3: Dynamic for TGW attachment workload route-table to central Inspection TGW attachment


#----------------------------Central Outbound TGW Routetable------------------------------
# You need to add more value if customer has more workload VPC
# Propagate Workload attachment to Central Outbound TGW-RTB
resource "aws_ec2_transit_gateway_route_table_propagation" "TGW-cen-out-to-wl-dr-rt-prop" {
  #count                          = var.number_of_subnets
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGW-atta.id
  transit_gateway_route_table_id = var.transit_gateway-cen-outb-rtb-id
}