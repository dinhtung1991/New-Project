# # ACM for *openway.com
# resource "aws_acm_certificate" "openway_acm" {
#   domain_name       = var.env != "prod" ? "${var.env}.${var.domain}" : var.domain
#   subject_alternative_names = [var.env != "prod" ? "*.${var.env}.${var.domain}": "*.${var.domain}" ]
#   validation_method = "DNS"

#   tags = {
#     Environment = var.env
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Validate ACM for *.lms-dev.skillupai.com
# resource "aws_route53_record" "openway_acm_record" {
#   name    = aws_acm_certificate.openway_acm.domain_validation_options.0.resource_record_name
#   type    = aws_acm_certificate.openway_acm.domain_validation_options.0.resource_record_type
#   zone_id = aws_route53_zone.openway_domain.zone_id
#   records = [aws_acm_certificate.openway_acm_acm.domain_validation_options.0.resource_record_value]
#   ttl     = 60
# }

# resource "aws_acm_certificate_validation" "lopenway_acm_validation" {
#   certificate_arn         = aws_acm_certificate.openway_acm.arn
#   validation_record_fqdns = [aws_route53_record.openway_acm_record.fqdn]
# }
