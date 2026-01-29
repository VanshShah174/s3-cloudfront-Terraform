variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "s3-bucket-terraform-with-cloudfront-v1-2901"
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
  default     = "xyz.com"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}