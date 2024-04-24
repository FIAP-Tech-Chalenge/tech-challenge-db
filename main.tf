resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Grupo de seguranca do RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.access_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS Security Group"
  }
}

resource "aws_db_instance" "my_postgres_db" {
  identifier             = "database-1"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.micro"
  username               = var.master_username
  password               = var.db_password
  db_subnet_group_name   = "my-db-subnet-group"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az          = false
  availability_zone = "us-east-1b"
  port              = 5432

  backup_retention_period = 1
  skip_final_snapshot     = true

  tags = {
    Name = "MyPostgreSQLInstance"
  }
}

