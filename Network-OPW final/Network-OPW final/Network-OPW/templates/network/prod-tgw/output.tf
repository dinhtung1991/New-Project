output "tgw-identifier" {
  description = "id of transit gateway"
  value = aws_ec2_transit_gateway.tgw.id
}

output "tgw" {
  value = aws_ec2_transit_gateway.tgw
}

output "central-outbound-tgw-attachment-id" {
  value = aws_ec2_transit_gateway_vpc_attachment.TGW-central-outbound-atta.id
}

output "central-outbound-tgw-attachment-rtb-id" {
  value = aws_ec2_transit_gateway_route_table.TGW-central-outbound-rt.id
}