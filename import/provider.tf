terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}

# this is default profile
provider "aws" {
  # Configuration options
}
