
#Create Transit Gateway
resource "aws_ec2_transit_gateway" "tgw" {
  default_route_table_association = var.enable_default_route_table_association ? "enable" : "disable"
  default_route_table_propagation = var.enable_default_route_table_propagation ? "enable" : "disable"
  tags = {
    Name = "${var.project_name}-${var.env}-${var.reg_short}-tgw",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "tgw",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# --------------------- Central Outbound Attachment --------------------------------------
#Create Transit Gateway attachment at central outbound vpc
resource "aws_ec2_transit_gateway_vpc_attachment" "TGW-central-outbound-atta" {
  # subnet_ids         = aws_subnet.tgw-attachment-subnet.*.id
  subnet_ids         = var.central_outbound_subnet_ids 
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"
  # vpc_id             = aws_vpc.central_outbound_vpc.id
  vpc_id             = var.central_outbound_vpc_id
  tags = {
    Name = "${var.project_name}-outbound-vpc-tgw-attachment"
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

#Create Transit Gateway attachment RTB at central outbound attachment
resource "aws_ec2_transit_gateway_route_table" "TGW-central-outbound-rt" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags = {
    Name = "${var.project_name}-outbound-vpc-tgw-attachment-rtb"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "TGW-central-outbound-rt-asso" {
  #count                          = var.number_of_subnets
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGW-central-outbound-atta.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW-central-outbound-rt.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "TGW-rt-prop" {
  #count                          = var.number_of_subnets
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGW-central-outbound-atta.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW-central-outbound-rt.id
}

# resource "aws_ec2_transit_gateway_route" "TGW-route" {
#   #count                          = var.number_of_subnets
#   destination_cidr_block         = "0.0.0.0/0"
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.TGW-atta.id
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.TGW-rt.id
# }



