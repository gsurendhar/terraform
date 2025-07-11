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

# this is dev profile
provider "aws" {
  # Configuration options
  alias   = "dev"
  profile = "dev" 
   region = "us-east-1"
}

# this is prod profile
provider "aws" {
  # Configuration options
  alias   = "prod"
  profile = "prod"
  region = "us-east-1"
}