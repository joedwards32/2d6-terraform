terraform {
  backend "s3" {
    bucket = "joedwards32.terraform"
    key    = "2d6-www/terraform.tfstate"
    region = "eu-west-1"
  }
}
