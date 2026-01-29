variable "oac_name" {
  description = "Name for Origin Access Control"
  type        = string
  default     = "demo-oac"
}

variable "s3_bucket_domain_name" {
  description = "S3 bucket regional domain name"
  type        = string
}

variable "origin_id" {
  description = "Origin ID for CloudFront"
  type        = string
}

variable "comment" {
  description = "Comment for CloudFront distribution"
  type        = string
  default     = "Static website distribution"
}

variable "default_root_object" {
  description = "Default root object"
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
}

variable "use_default_certificate" {
  description = "Use CloudFront default certificate"
  type        = bool
  default     = true
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN"
  type        = string
  default     = null
}

variable "domain_aliases" {
  description = "Domain aliases for CloudFront"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags for CloudFront distribution"
  type        = map(string)
  default     = {}
}