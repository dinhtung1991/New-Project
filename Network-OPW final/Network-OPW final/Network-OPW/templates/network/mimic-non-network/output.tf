# Output of vpc id
# Use for create tgw-attachment at vpc
output "vpc-id" {
  description = "The ID of the VPC"
  value       = aws_vpc.workload-vpc.id
}

# Output of tgw attachment Subnet
# Use for create tgw-attachment at vpc
output "tgw-attachment-subnet-ids" {
  description = "tgw-attachment Subnets IDS"
  value       = aws_subnet.tgw-attachment-subnet.*.id
}

output "public-subnet_id" {
  value = aws_subnet.public-subnet.*.id
}
output "mimic-non-prod-id"{
  value = aws_security_group.mimic-non-prod.id
}
