resource "aws_security_group" "apollo-prod-service" {
  #SG name
  name        = "apollo-prod-service"
  description = "opw"
  vpc_id      = aws_vpc.workload-vpc.id
  
  ingress {
    description = "https"
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
    from_port   = 9000
    to_port     = 9000
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
    from_port   = 20300
    to_port     = 20300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "MYSQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
   ingress {
    description = "http"
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
    Name = "${var.project_name}-${var.env}-apollo-prod-service-${var.reg_short}-sg",
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
resource "aws_security_group" "apollo-prod-application" {
  name        = "apollo-prod-application"
  description = "opw"
  vpc_id      = aws_vpc.workload-vpc.id
  
   ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "TLS from VPC"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
    ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
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
    Name = "${var.project_name}-${var.env}-apollo-prod-application-${var.reg_short}-sg",
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
resource "aws_security_group" "apollo-prod-database" {
  name        = "apollo-prod-database"
  description = "opw"
  vpc_id      =aws_vpc.workload-vpc.id
    ingress {
    description = "ssh"
    from_port   = 3306
    to_port     = 3306
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
    Name = "${var.project_name}-${var.env}-apollo-prod-database-${var.reg_short}-sg",
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