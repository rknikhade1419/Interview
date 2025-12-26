resource "aws_vpc" "tcw_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tcw_vpc"
  }
}

resource "aws_subnet" "db_subnet_1" {
  vpc_id                  = aws_vpc.tcw_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "tag_database1"
  }
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id                  = aws_vpc.tcw_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "tag_database2"
  }
}

resource "aws_security_group" "tcw_sg" {
  name        = "tcw-security-group"
  description = "Security group for RDS database"
  vpc_id      = aws_vpc.tcw_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tcw_security_group"
  }
}
