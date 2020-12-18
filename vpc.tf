provider "aws" {
  region     = var.region
}

# vpc.tf

data "aws_availability_zones" "available" {
}

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${var.env}"
    Environment = var.env
  }
}

resource "aws_subnet" "bastion_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_1

  tags = {
    Name = "managed-subnet-bastion-${var.env}"
    Environment = var.env
  }
  
}
resource "aws_subnet" "web_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_2

  tags = {
    Name = "managed-subnet-web-${var.env}"
    Environment = var.env
  }
}
resource "aws_subnet" "application_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_3

  tags = {
    Name = "managed-subnet-web-${var.env}"
    Environment = var.env
  }
}