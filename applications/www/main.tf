locals {
  lambda_function_associations = [{
    event_type   = "viewer-request"
    include_body = false
    lambda_arn   = "arn:aws:lambda:us-east-1:135335036553:function:2d6-www-edge-auth:7"
  }]
}

# TODO: Define lambda with TF, currently created by hand

# S3 static site 
module "www" {
  source                       = "../../../tf-modules/static-site/"
  dns_zone                     = "2d6.club" 
  site_name                    = "www"
  site_files                   = "../../../2d6-www/public/"
  subject_alt_names            = ["2d6.club", "www.2d6.club"]
  lambda_function_association  = local.lambda_function_associations
}
