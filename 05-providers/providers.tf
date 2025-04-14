terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-east-2"
  alias = "us-east"
}

provider "aws" {
  region = "us-west-1"
  alias = "us-west"
}

resource "aws_s3_bucket" "us-east" {
  bucket = "example-lkdygflisdfiousdgfoujgsvfd"
  provider = aws.us-east
}

resource "aws_s3_bucket" "us-west" {
  bucket = "example-ljadvfidsidgfioudgfiousdouh"
  provider = aws.us-west
}

