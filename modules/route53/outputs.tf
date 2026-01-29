output "zone_id" {
  description = "Route 53 hosted zone ID"
  value       = aws_route53_zone.main.zone_id
}

output "zone_name_servers" {
  description = "Route 53 hosted zone name servers"
  value       = aws_route53_zone.main.name_servers
}

output "certificate_arn" {
  description = "ACM certificate ARN"
  value       = aws_acm_certificate.main.arn
}

output "certificate_domain_validation_options" {
  description = "Certificate domain validation options"
  value       = aws_acm_certificate.main.domain_validation_options
}

output "validated_certificate_arn" {
  description = "Validated ACM certificate ARN"
  value       = var.enable_certificate_validation ? aws_acm_certificate_validation.main[0].certificate_arn : null
}