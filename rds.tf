provider "aws" {
  region = var.region
}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.77.0"
  name                 = "food-system-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_db_subnet_group" "food-system" {
  name       = "food-system-sub"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "Fiap"
  }
}

resource "aws_security_group" "rds" {
  name   = "food-system-rds"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Fiap"
  }
}

resource "aws_db_parameter_group" "food-system" {
  name   = "food-system-parameter-group"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "food-system" {
  identifier             = "db-fiap-fast-food"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = 14.9
  username               = var.db_user
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.food-system.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.food-system.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}