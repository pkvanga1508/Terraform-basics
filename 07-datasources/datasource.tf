data "aws_ami" "amazon_ami_us_east_2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}


data "aws_ami" "amazon_ami_us_east_1" {
  most_recent = true
  provider = aws.us-east-1
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}


data "aws_caller_identity" "current_user" {
    # This data source is used to get the current AWS account ID
    # and is referenced in the IAM policy document.
    # It is not necessary to include any arguments.
}

data "aws_region" "current_region" {
    # This data source is used to get the current AWS region
    # and is referenced in the IAM policy document.
    # It is not necessary to include any arguments.
}

data "aws_region" "current_region_us_east_1" {
    provider = aws.us-east-1
  # This data source is used to get the current AWS region
  # and is referenced in the IAM policy document.
  # It is not necessary to include any arguments.
}

data "aws_vpc" "console_managed_prod_vpc" {

  tags = {
    Env = "Prod"
  }
  # This data source is used to create an IAM policy document
  # that allows the EC2 instance to access S3 and CloudWatch.
  # It is not necessary to include any arguments.
}

data "aws_availability_zones" "availability_zones_us-east-1" {

  provider = aws.us-east-1
  state = "available"
    # This data source is used to get the availability zones
    # in the current region and is referenced in the EC2 instance
    # resource to create the instance in a specific availability zone.
    # It is not necessary to include any arguments.
}

data "aws_availability_zones" "availability_zones_default" {
  state = "available"
  # This data source is used to get the availability zones
  # in the current region and is referenced in the EC2 instance
  # resource to create the instance in a specific availability zone.
  # It is not necessary to include any arguments.
}

data "aws_iam_policy_document" "static_website" {

  statement {
    sid = "PublicReadGetObject"
    actions = ["s3:GetObject"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    resources = [
      "${aws_s3_bucket.public_read_bucket.arn}/*"
    ]
  }
}