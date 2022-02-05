# S3 static site 
module "www" {
  source            = "../../../tf-modules/static-site/"
  dns_zone          = "2d6.club" 
  site_name         = "www"
  site_files        = "../../../2d6-www/public/"
  subject_alt_names = ["2d6.club", "www.2d6.club"]
}
