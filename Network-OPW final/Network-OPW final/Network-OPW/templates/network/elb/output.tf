output "network_load_balancer_arn" {
    value = aws_lb.network_load_balancer.arn
  
}
output "nlb_listener_arn" {
    value = aws_lb_listener.nlb_listener.arn
  
}
output "nlb_listener_id" {
    value = aws_lb_listener.nlb_listener.id
  
}
output "network_load_blancer_zone_id" {
    value = aws_lb.network_load_balancer.zone_id
  
}

output "nlb_targert_group_arn" {
    value = aws_lb_target_group.nlb_targert_group.arn
  
}


# output "nlb_attachment_arn" {
#     value = aws_lb_target_group_attachment.nlb_attachment_arn
  
# }

