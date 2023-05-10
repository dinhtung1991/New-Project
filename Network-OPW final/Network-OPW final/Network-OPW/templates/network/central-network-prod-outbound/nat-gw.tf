# Create 3 EIP 
resource "aws_eip" "nat" {
  count = var.number_of_natgw
  tags = {
    Name = "${var.project_name}-${var.env}-${var.az_short[count.index]}-eip"
  }
  vpc = true
}

# 3 nat gateway
resource "aws_nat_gateway" "NGW" {
  depends_on = [aws_internet_gateway.IGW]
  count = var.number_of_natgw
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.natgw-subnet[count.index].id
  tags = {
    Name = "${var.project_name}-${var.env}-${var.az_short[count.index]}-natgw",
    "organization" = var.organization,
    "project-name" = var.project_name,
    "environment" = var.env,
    "resource-type" = "nat-gateways",
    "component" = var.component,
    "team" = var.team,
    "owner"= var.owner,
    "iac" = var.iac,
    "site" = var.site,
    "canbedelete" = var.canbedelete
  }  
}