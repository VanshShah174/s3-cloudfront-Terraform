variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "cloudfront_arn" {
  description = "CloudFront distribution ARN for bucket policy"
  type        = string
}

variable "website_files" {
  description = "Website files to upload"
  type = map(object({
    source       = string
    etag         = string
    content_type = string
  }))
}