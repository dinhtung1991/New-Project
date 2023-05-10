##########################################################################################
#Create Subnet NACL for Workload DR prod vpc
##########################################################################################

# 3 Public Common network subnets NACL
resource "aws_network_acl" "public-dmz-acl" {
  vpc_id = aws_vpc.workload-vpc.id
  subnet_ids = aws_subnet.public-dmz-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-public-dmz-${var.reg_short}-acl",
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

# # 3 Private EKS control plane subnets NACL
# resource "aws_network_acl" "eks-control-plane-acl" {
#   vpc_id = aws_vpc.workload-vpc.id
#   subnet_ids = aws_subnet.eks-control-plane-subnet.*.id
#     ingress {
#     protocol   = "-1"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }
#     egress {
#     protocol   = "-1"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }
#   tags = {
#     Name = "${var.project_name}-${var.env}-eks-control-plane-${var.reg_short}-acl",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "network acls",
#     "component" = var.component,
#     "team" = var.team,
#     "owner"= var.owner,
#     "iac" = var.iac,
#     "site" = var.site,
#     "canbedelete" = var.canbedelete
#   }
# }

# # 3 Private application subnets NACL
# resource "aws_network_acl" "application-acl" {
#   vpc_id = aws_vpc.workload-vpc.id
#   subnet_ids = aws_subnet.application-subnet.*.id
#     ingress {
#     protocol   = "-1"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }
#     egress {
#     protocol   = "-1"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }
#   tags = {
#     Name = "${var.project_name}-${var.env}-application-${var.reg_short}-acl",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "network acls",
#     "component" = var.component,
#     "team" = var.team,
#     "owner"= var.owner,
#     "iac" = var.iac,
#     "site" = var.site,
#     "canbedelete" = var.canbedelete
#   }
# }


# 3 Private EC2 Workload subnets NACL
resource "aws_network_acl" "private-back-office-acl" {
  vpc_id = aws_vpc.workload-vpc.id
  subnet_ids = aws_subnet.private-back-office-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-private-back-office-${var.reg_short}-acl",
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


# 3 Private EC2 Workload subnets NACL
resource "aws_network_acl" "private-ec2-acl" {
  vpc_id = aws_vpc.workload-vpc.id
  subnet_ids = aws_subnet.private-ec2-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-private-ec2-${var.reg_short}-acl",
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


# 3 Private EC2 Workload subnets NACL
resource "aws_network_acl" "private-application-acl" {
  vpc_id = aws_vpc.workload-vpc.id
  subnet_ids = aws_subnet.private-application-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-private-application-${var.reg_short}-acl",
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

# 3 Private DataBase  Workload subnets NACL 
resource "aws_network_acl" "database-acl" {
  vpc_id = aws_vpc.workload-vpc.id
  subnet_ids = aws_subnet.database-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "${var.project_name}-${var.env}-database-${var.reg_short}-acl",
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

# 3 Public tgw attachment  subnets NACL
resource "aws_network_acl" "tgw-attachment-acl" {
  vpc_id = aws_vpc.workload-vpc.id
  subnet_ids = aws_subnet.tgw-attachment-subnet.*.id
    ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
    egress {
    protocol   = "-1"
    rule_no    = 100
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