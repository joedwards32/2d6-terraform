terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46"
    }
  }
}

# Configure aws provider
provider "aws" {
  profile = "default"
  region  = var.region
}

