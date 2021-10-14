variable "dns_zone" {
  description = "DNS Zone for site's A record"
  type        = string
  default     = "2d6.club"
}

variable "site_name" {
  description = "Site short DNS name"
  type        = string
  default     = "www"
}

variable "site_files" {
  description = "Path to site files"
  type        = string
  default     = "/home/john/git/2d6-www/public"
}

variable "subject_alt_names" {
  description = "SSL certificate subject alternative names, defaults to none"
  type        = list
  default     = ["2d6.club", "www.2d6.club"]
}

variable "routing_rules" {
  description = "A json array containing routing rules describing redirect behavior and when redirects are applied"
  type        = string

  default = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "/"
    },
    "Redirect": {
        "ReplaceKeyWith": "index.html"
    }
}]
EOF

}

variable "cf_default_ttl" {
  description = "CloudFront default TTL for cachine"
  type        = string
  default     = "86400"
}

variable "cf_min_ttl" {
  description = "CloudFront minimum TTL for caching"
  type        = string
  default     = "0"
}

variable "cf_max_ttl" {
  description = "CloudFront maximum TTL for caching"
  type        = string
  default     = "31536000"
}

variable "cf_price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_All"
}

variable "custom_error_response" {
  description = "Optionally a list of custom error response configurations for CloudFront distribution"
  type = set(object({
    error_code         = number
    response_code      = number
    response_page_path = string
  }))
  default = []
}
