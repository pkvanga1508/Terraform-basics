terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }

  required_version = "~> 1.7"
}

provider "aws" {
  region = "us-east-2"
}