resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Grupo de segurança do RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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
  identifier             = "techchallenge"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.micro"
  username               = var.master_username
  password               = var.db_password
  db_subnet_group_name   = "default-vpc-00fbcda6637a258e4"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az               = false
  availability_zone      = "us-east-1b"
  port                   = 5432
  db_name                = "techchallenge"
  publicly_accessible    = true

  backup_retention_period = 0
  skip_final_snapshot     = true

  tags = {
    Name = "TechChallengeRDS"
  }
}


