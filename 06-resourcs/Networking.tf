locals {
  common_tags = {
    ManagedBy  = "Terraform"
    Project    = "06-resources"
    costCenter = "123456"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = merge(local.common_tags, {
    Name = "06-resources-vpc"
  })
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.main.id
  tags = merge(local.common_tags, {
    Name = "06-resources-public-subnet"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.common_tags, {
    Name = "06-resources-igw"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(local.common_tags, {
    Name = "06-resources-public-route-table"
  })
}

resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


