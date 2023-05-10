resource "aws_security_group" "way4-non-prod-ws" {
  #SG name
  name        = "way4-non-prod-ws"
  description = "opw"
  vpc_id      = aws_vpc.workload-vpc.id
  
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 17000
    to_port     = 17000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
    ingress {
    description = "TLS from VPC"
    from_port   = 9094
    to_port     = 9904
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 18000
    to_port     = 18000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 20104
    to_port     = 20104
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 9096
    to_port     = 9096
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 20300
    to_port     = 20300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 9085
    to_port     = 9085
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
    Name = "${var.project_name}-${var.env}-way4-non-prod-ws-${var.reg_short}-sg",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "security-group",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}
#SG name
resource "aws_security_group" "way4-non-prod-ts" {
  name        = "way4-non-prod-ts"
  description = "opw"
  vpc_id      = aws_vpc.workload-vpc.id
  
   ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "TLS from VPC"
    from_port   = 9085
    to_port     = 9085
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 20500
    to_port     = 20500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 21118
    to_port     = 21118
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 8686
    to_port     = 8686
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 1500
    to_port     = 1500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 19096
    to_port     = 19096
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 20600
    to_port     = 20600
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "TLS from VPC"
    from_port   = 12345
    to_port     = 12345
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
    Name = "${var.project_name}-${var.env}-way4-non-prod-ts-${var.reg_short}-sg",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "security-group",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}
resource "aws_security_group" "way4-non-prod-fs" {
  name        = "way4-non-prod-fs"
  description = "opw"
  vpc_id      =aws_vpc.workload-vpc.id
  
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "TLS from VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "TLS from VPC"
    from_port   = 9998
    to_port     = 9998
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-${var.env}-way4-non-prod-fs-${var.reg_short}-sg",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "security-group",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

resource "aws_security_group" "way4-non-prod-db" {
  name        = "way4-non-prod-db"
  description = "opw"
  vpc_id      =aws_vpc.workload-vpc.id
    ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    description = "TLS from VPC"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 1524
    to_port     = 1524
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-${var.env}-way4-non-prod-db-${var.reg_short}-sg",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "security-group",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}

resource "aws_security_group" "Way4-non-prod-3D-secure-ACS-public" {
  name        = "Way4-non-prod-3D-secure-ACS-public"
  description = "opw"
  vpc_id      =aws_vpc.workload-vpc.id
    ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "TLS from VPC"
    from_port   = 9998
    to_port     = 9998
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    description = "TLS from VPC"
    from_port   = 9702
    to_port     = 9702
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-${var.env}-Way4-non-prod-3D-secure-ACS-public-${var.reg_short}-sg",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "security-group",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }
}