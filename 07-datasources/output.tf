output "aws_caller_id" {
  value = data.aws_caller_identity.current_user.account_id
}

output "aws_region" {
  value = data.aws_region.current_region.name
}

output "aws_region_us_east_1" {
  value = data.aws_region.current_region_us_east_1.name
}

output "console_managed_vpc" {
  value = data.aws_vpc.console_managed_prod_vpc.id
}

output "aws_availability_zones_default" {
  value = data.aws_availability_zones.availability_zones_default
}

output "aws_availability_zones_us_east_1" {
  value = data.aws_availability_zones.availability_zones_us-east-1.names
}

output "aws_iam_policy" {
  value = data.aws_iam_policy_document.static_website.json
}