terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.demo-vpc.id
}

resource "aws_subnet" "private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.demo-vpc.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo-vpc.id
}

resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rtb.id
}