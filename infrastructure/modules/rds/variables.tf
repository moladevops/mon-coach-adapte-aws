# infrastructure/modules/rds/variables.tf
# VARIABLES POUR MODULE RDS

# Informations générales
variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "environment" {
  description = "Environnement (dev/staging/prod)"
  type        = string
}

# Informations réseau
variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Nom du subnet group pour RDS"
  type        = string
}

variable "ecs_security_group_id" {
  description = "ID du security group ECS (pour autoriser accès RDS)"
  type        = string
}

# Configuration MySQL
variable "mysql_version" {
  description = "Version MySQL à utiliser"
  type        = string
  default     = "8.0.35"
  # Version stable et récente
}

variable "instance_class" {
  description = "Type d'instance RDS"
  type        = string
  default     = "db.t3.micro"
  # db.t3.micro = 1 vCPU, 1GB RAM (parfait pour dev)
  # db.t3.small = 2 vCPU, 2GB RAM (pour staging)
  # db.t3.medium = 2 vCPU, 4GB RAM (pour prod small)
}

# Configuration Storage
variable "allocated_storage" {
  description = "Taille storage initial (GB)"
  type        = number
  default     = 20
  # 20GB suffisant pour WordPress dev
}

variable "max_allocated_storage" {
  description = "Taille storage maximum (auto-scaling)"
  type        = number
  default     = 100
  # Auto-scale jusqu'à 100GB si besoin
}

# Configuration base de données
variable "db_name" {
  description = "Nom de la base de données WordPress"
  type        = string
  default     = "wordpress"
}

variable "db_username" {
  description = "Nom d'utilisateur administrateur"
  type        = string
  default     = "admin"
  # Éviter 'root' pour sécurité
}

# Configuration backup
variable "backup_retention_days" {
  description = "Nombre de jours de rétention backup"
  type        = number
  default     = 7
  # 7 jours pour dev, 30 pour prod
}