# Output of VPC
output "vpc-id" {
  description = "The ID of the VPC"
  value       = aws_vpc.central_outbound_vpc.id
}

# Output of IGW

output "igw" {
  value = aws_internet_gateway.IGW.id
}

# Output of EIP For NAT Gateways

output "eip-ngw" {
  value = aws_eip.nat.*.id
}

# Output Of NAT-Gateways

output "ngw" {
  value = aws_nat_gateway.NGW.*.id
}

# Output of Public Subnet
output "public-subnet-ids" {
  description = "Public Subnets IDS"
  value       = aws_subnet.public-subnet.*.id
}

# Output Of Vpc endpoint Subnet
output "vpc-endpoint-subnet-ids" {
  description = "Private Subnets IDS"
  value       = aws_subnet.vpc-endpoint-subnet.*.id
}

# network-firewall Subnets

output "network-firewall_subnets" {
  description = "List of IDs of network-firewall subnets"
  value       = aws_subnet.network-firewall-subnet.*.id
}

# Output Of Vpc gwlb endpoint Subnet
output "gwlb-endpoint-subnet-ids" {
  description = "Private Subnets IDS"
  value       = aws_subnet.gwlb-endpoint-subnet.*.id
}

# Output of Public Subnet
output "natgw-subnet-ids" {
  description = "natgw Subnets IDS"
  value       = aws_subnet.natgw-subnet.*.id
}

# Output of tgw attachment Subnet

output "tgw-attachment-subnet-ids" {
  description = "tgw-attachment Subnets IDS"
  value       = aws_subnet.tgw-attachment-subnet.*.id
}

# output "vpce_id" {
#   value = aws_networkfirewall_firewall.NFW.id
# }

# output "vpce_arn" {
#   value = aws_networkfirewall_firewall.NFW.arn
# }

# output "vpce_endpoint" {
#   # value = aws_networkfirewall_firewall.NFW.firewall_status.0.sync_states[*].attachment.0.endpoint_id
#   value = local.endpoint[0]
# }