terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33"
    }
  }
  //  required_version = ">= 1.7.0"
  required_version = "> 1.7.0, <1.7.0"
}

Provider "aws" {
  region = "us-east-2"
}

#Actively managed by our terrraform project
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket"
}

#Manageed by someone else Not managed by our terraform project
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us"
}

variable "my_variable" {
  type        = string
  description = "This is my bucket name"
  default     = "my_default_bucket_name_value"
}

output "bucket_id" {
  value = local.local_example #singlular local not locals
}

#creates temporary variables
locals {
  local_example = "This is a local value"
}

module "my_module" {
  source = "./module-example"
}



