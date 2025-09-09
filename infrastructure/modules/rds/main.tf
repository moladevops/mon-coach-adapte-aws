# infrastructure/modules/rds/main.tf
# MODULE RDS - BASE DE DONNÉES MYSQL 8.0.40

# Security Group pour RDS
resource "aws_security_group" "rds" {
  name        = "${var.project_name}-${var.environment}-rds"
  description = "Security group pour RDS MySQL"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ecs_security_group_id]
    description     = "MySQL from ECS tasks"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds"
    Environment = var.environment
  }
}

# Mot de passe aléatoire
resource "random_password" "db_password" {
  length  = 16
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Parameter Group pour MySQL 8.0
resource "aws_db_parameter_group" "main" {
  family = "mysql8.0"
  name   = "${var.project_name}-${var.environment}-mysql-params"

  parameter {
    name  = "max_connections"
    value = var.environment == "prod" ? "200" : "100"
  }

  parameter {
    name  = "innodb_buffer_pool_size"
    value = "{DBInstanceClassMemory*3/4}"
  }

  parameter {
    name  = "slow_query_log"
    value = "1"
  }

  parameter {
    name  = "long_query_time"
    value = "2"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-mysql-params"
    Environment = var.environment
  }
}

# Instance RDS MySQL
resource "aws_db_instance" "main" {
  identifier = "${var.project_name}-${var.environment}-mysql"
  
  engine         = "mysql"
  engine_version = var.mysql_version
  instance_class = var.instance_class
  
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type         = "gp3"
  storage_encrypted    = true

  db_name  = var.db_name
  username = var.db_username
  password = random_password.db_password.result
  port     = 3306

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = false

  parameter_group_name = aws_db_parameter_group.main.name

  backup_window              = "03:00-04:00"
  backup_retention_period    = var.backup_retention_days
  delete_automated_backups   = true
  deletion_protection        = false

  maintenance_window = "sun:04:00-sun:05:00"
  auto_minor_version_upgrade = true

  skip_final_snapshot = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-mysql"
    Environment = var.environment
  }
}