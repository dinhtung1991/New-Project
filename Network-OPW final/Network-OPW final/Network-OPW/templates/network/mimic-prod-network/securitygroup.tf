resource "aws_security_group" "mimic-prod" {
  #SG name
  name        = "mimic-prod"
  description = "opw"
  vpc_id      = aws_vpc.workload-vpc.id
    ingress {
    description = "TLS from VPC"
    from_port   = 20500
    to_port     = 20500
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
    from_port   = 20600
    to_port     = 20600
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
    Name = "${var.project_name}-${var.env}-mimic-prod-${var.reg_short}-sg",
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
