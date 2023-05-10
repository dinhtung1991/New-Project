# # Create HostedZone
# resource "aws_route53_zone" "openway_domain" {
#   name      = var.env != "prod" ? "${var.env}.${var.domain}" : var.domain
#   comment   = "DNS for ${var.project} on ${var.env} Environment"

#   tags = {
#     Stage = "${var.env}"
#   }
# }
