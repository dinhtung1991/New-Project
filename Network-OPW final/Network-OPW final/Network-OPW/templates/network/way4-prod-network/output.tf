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
### Subnet
output "public-dmz-subnet_id" {
  value = aws_subnet.public-dmz-subnet.*.id
}

output "private-ec2-subnet_id" {
  value = aws_subnet.private-ec2-subnet.*.id
}

output "private-application-subnet_id" {
  value = aws_subnet.private-application-subnet.*.id
}

output "database-subnet_id" {
  value = aws_subnet.database-subnet.*.id
}

output "private-back-office-subnet_id" {
  value = aws_subnet.private-back-office-subnet.*.id
}



#### Security Group 

output "way4-prod-ts-id"{
  value = aws_security_group.way4-prod-ts.id
}

output "way4-prod-db-id"{
  value = aws_security_group.way4-prod-db.id
}
output "way4-prod-fs-id"{
  value = aws_security_group.way4-prod-fs.id
}
output "way4-prod-ws-id"{
  value = aws_security_group.way4-prod-ws.id
}
output "nlb_security_group-id"{
  value = aws_security_group.nlb_security_group.id
}






