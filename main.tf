locals {
  origin_id = "S3-${var.bucket_name}"
  
  website_files = {
    for file in fileset("${path.module}/www", "**/*") : file => {
      source       = "${path.module}/www/${file}"
      etag         = filemd5("${path.module}/www/${file}")
      content_type = lookup({
        "html" = "text/html",
        "css"  = "text/css",
        "js"   = "application/javascript",
        "json" = "application/json",
        "png"  = "image/png",
        "jpg"  = "image/jpeg",
        "jpeg" = "image/jpeg",
        "gif"  = "image/gif",
        "svg"  = "image/svg+xml",
        "ico"  = "image/x-icon",
        "txt"  = "text/plain"
      }, split(".", file)[length(split(".", file)) - 1], "application/octet-stream")
    }
  }
}

module "s3" {
  source = "./modules/s3"
  
  bucket_name     = var.bucket_name
  cloudfront_arn  = module.cloudfront.distribution_arn
  website_files   = local.website_files
}

module "cloudfront" {
  source = "./modules/cloudfront"
  
  s3_bucket_domain_name = module.s3.bucket_domain_name
  origin_id            = local.origin_id
  comment              = "Static website for ${var.domain_name}"
  
  tags = {
    Environment = var.environment
    Project     = "Static Website"
  }
}

module "route53" {
  source = "./modules/route53"
  
  domain_name                   = var.domain_name
  subject_alternative_names     = ["www.${var.domain_name}"]
  enable_certificate_validation = false  # Set to true with real domain
  
  tags = {
    Environment = var.environment
    Project     = "Static Website"
  }
}

# Route 53 resources (for demonstration)
# resource "aws_route53_zone" "main" {
#   name = var.domain_name
#   
#   tags = {
#     Environment = var.environment
#     Project     = "Static Website"
#   }
# }

# resource "aws_acm_certificate" "main" {
#   domain_name       = var.domain_name
#   validation_method = "DNS"
#   
#   subject_alternative_names = ["www.${var.domain_name}"]
#   
#   lifecycle {
#     create_before_destroy = true
#   }
#   
#   tags = {
#     Environment = var.environment
#     Project     = "Static Website"
#   }
# }