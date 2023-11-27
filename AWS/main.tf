terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.00"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key=var.access_key
  secret_key=var.secret_key
}

# Define the private cloud
resource "aws_vpc" "allopen-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Create a gateway to the internet
resource "aws_internet_gateway" "allopen-ig" {
  vpc_id = aws_vpc.allopen-vpc.id
}

# Allow connections to route to the internet
resource "aws_route" "internet-route" {
  route_table_id              = aws_vpc.allopen-vpc.main_route_table_id
  destination_cidr_block      = "0.0.0.0/0"
  gateway_id                  = aws_internet_gateway.allopen-ig.id
}

# Scan AWS and get the "available" availability zones
data "aws_availability_zones" "available" {
  state                       = "available"
}

# For each available zone, create a subnet.
resource "aws_subnet" "allopen-subnets" {
  count                       = length(data.aws_availability_zones.available.names)
  vpc_id                      = aws_vpc.allopen-vpc.id
  cidr_block                  = "10.0.${count.index}.0/24"
  map_public_ip_on_launch     = true
  availability_zone           = element(data.aws_availability_zones.available.names, count.index)
}

resource "aws_db_subnet_group" "subnet_group" {
  name                        = "allopensubgroup"
  subnet_ids                  = aws_subnet.allopen-subnets.*.id
}

# Create a security group within the VPC that allows for open connetions in and out
resource "aws_security_group" "allopen-sg" {
  name                        = "allopen-sg"
  description                 = "AllOpen security group"
  vpc_id                      = aws_vpc.allopen-vpc.id

  # Allow all inbound traffic
  ingress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "lab_database" {
  depends_on              = [aws_internet_gateway.allopen-ig]
  vpc_security_group_ids  = [aws_security_group.allopen-sg.id]
  db_subnet_group_name    = aws_db_subnet_group.subnet_group.id
  allocated_storage       = 30
  engine                  = "sqlserver-se"
  engine_version          = "16.00"
  instance_class          = "db.t3.xlarge" 
  identifier              = "labsqldb"
  username                = var.db_username
  password                = var.db_password
  skip_final_snapshot     = true
  apply_immediately       = true
  publicly_accessible     = true
  license_model           = "license-included"
  backup_retention_period = 1
  multi_az                = true
}

output "database_endpoint" {
  description = "The endpoint of the database"
  value       = aws_db_instance.lab_database.address
}

output "rds-url" {
  value = aws_db_instance.lab_database.endpoint
}

resource "aws_db_instance" "labsqldb" {
  depends_on              = [aws_db_instance.lab_database]
  allocated_storage       = 30
  engine                  = "sqlserver-se"
  engine_version          = "16.00"
  instance_class          = "db.t3.xlarge" 
  skip_final_snapshot     = true
  license_model           = "license-included"
  backup_retention_period = 7
  replicate_source_db     = aws_db_instance.lab_database.identifier
}

output "replica-url" {
  value=aws_db_instance.labsqldb.endpoint
}
