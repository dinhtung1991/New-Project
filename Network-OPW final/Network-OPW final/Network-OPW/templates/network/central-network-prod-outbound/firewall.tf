# resource "aws_networkfirewall_firewall_policy" "torus-network-firewall-policy-1" {
#   name = "torus-network-firewall-policy-1"

#   firewall_policy {
#     stateless_default_actions          = ["aws:pass"]
#     stateless_fragment_default_actions = ["aws:drop"]
#     # stateless_rule_group_reference {
#     #   priority     = 1
#     #   resource_arn = aws_networkfirewall_rule_group.torus-network-firewall-policy-1.arn
#     # }
#   }

#   tags = {
#     Name = "${var.project_name}-${var.env}-${var.reg_short}-nfw-policy",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "network firewall policy",
#     "component-role" = var.component-role  
#   }
# }

# resource "aws_networkfirewall_firewall" "NFW" {
#   name                = "torus-network-firewall"
#   firewall_policy_arn = aws_networkfirewall_firewall_policy.torus-network-firewall-policy-1.id
#   vpc_id              = aws_vpc.main_vpc.id

#   dynamic "subnet_mapping" {
#     for_each = aws_subnet.network-firewall-subnet[*].id
#     content {
#       subnet_id = subnet_mapping.value
#     }
#   }

#   tags = {
#     Name = "${var.project_name}-${var.env}-${var.reg_short}-nfw",
#     "organization" = var.organization,
#     "project-name" = var.project_name,
#     "environment" = var.env,
#     "resource-type" = "network firewall",
#     "component-role" = var.component-role  
#   }
# }

# # data "aws_vpc_endpoint_service" "firewall" {
# #   vpc_id       = aws_vpc.main_vpc.id

# #   tags = {
# #     "AWSNetworkFirewallManaged" = "true"
# #     "Firewall" = aws_networkfirewall_firewall.NFW.arn
# #   }

# #   depends_on = [aws_networkfirewall_firewall.NFW]
# # }

# # resource "aws_vpc_endpoint_service" "example" {
# #   acceptance_required        = false
# #   gateway_load_balancer_arns = [aws_networkfirewall_firewall.NFW.id]
# # }
# locals {
#   endpoint = aws_networkfirewall_firewall.NFW.firewall_status.0.sync_states[*].attachment.0.endpoint_id
# }
