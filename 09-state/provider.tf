terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.48.0"
    }
  }

  backend "s3" {
    bucket       = "aslearnings-remote-tfstate"
    key          = "remote-state-demo.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

