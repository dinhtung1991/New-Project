##########################################################################################
# We create 3 public acl, 3 natgw acl, 3 network-firewalls acl,  3 gwlb-endpoint acl
# 3 endpoint acl, 3 Other Workload acl.
##########################################################################################

# 3 Public Common network subnets acl
resource "aws_network_acl" "public-subnets-acl" {
  vpc_id = aws_vpc.central_outbound_vpc.id
  subnet_ids = aws_subnet.public-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-public-${var.reg_short}-acl",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "network acls",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# 3 Public Nat-gw subnets NACL
resource "aws_network_acl" "natgw-subnets-acl" {
  vpc_id = aws_vpc.central_outbound_vpc.id
  subnet_ids = aws_subnet.natgw-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-natgw-${var.reg_short}-acl",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "network acls",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# 3 Public vpc-endpoint subnets nacl
resource "aws_network_acl" "endpoint-subnets-acl" {
  vpc_id = aws_vpc.central_outbound_vpc.id
  subnet_ids = aws_subnet.vpc-endpoint-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-vpc-endpoint-${var.reg_short}-acl",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "network acls",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# 3 Public network-firewall subnets nacl
resource "aws_network_acl" "network-firewall-subnets-acl" {
  vpc_id = aws_vpc.central_outbound_vpc.id
  subnet_ids = aws_subnet.network-firewall-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-network-firewall-${var.reg_short}-acl",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "network acls",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# 3 Public gwlb-endpoint for 3rd firewall subnets nacl
resource "aws_network_acl" "gwlb-endpoint-subnet" {
  vpc_id = aws_vpc.central_outbound_vpc.id
  subnet_ids = aws_subnet.gwlb-endpoint-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-gwlb-endpoint-${var.reg_short}-acl",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "network acls",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

# 3 Public tgw-attachment subnets
resource "aws_network_acl" "tgw-attachment-subnets-acl" {
  vpc_id = aws_vpc.central_outbound_vpc.id
  subnet_ids = aws_subnet.tgw-attachment-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 10000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-tgw-attachment-${var.reg_short}-acl",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "network acls",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}