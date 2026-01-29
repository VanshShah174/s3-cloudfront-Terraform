variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
}

variable "subject_alternative_names" {
  description = "Subject alternative names for the certificate"
  type        = list(string)
  default     = []
}

variable "enable_certificate_validation" {
  description = "Enable certificate validation (requires real domain)"
  type        = bool
  default     = false
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  type        = string
  default     = null
}

variable "cloudfront_hosted_zone_id" {
  description = "CloudFront distribution hosted zone ID"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for Route 53 resources"
  type        = map(string)
  default     = {}
}