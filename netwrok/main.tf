resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true 

  tags = {
    Name = "${var.environment}-VPC"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "${var.region}${var.availability_zone_tail}"
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true   

  tags = {
    Name = "${var.environment}-Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-IGW"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-RT"
  }
}

resource "aws_route_table_association" "rt_assc" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}