# infrastructure/modules/ecs/variables.tf
# VARIABLES POUR MODULE ECS

# Informations générales
variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "environment" {
  description = "Environnement (dev/staging/prod)"
  type        = string
}

# Informations réseau (depuis module VPC)
variable "vpc_id" {
  description = "ID du VPC où créer les ressources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block du VPC (pour security groups)"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs des subnets publics pour Load Balancer"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs des subnets privés pour ECS tasks"
  type        = list(string)
}

# Configuration ECS
variable "cpu" {
  description = "CPU pour les containers (256, 512, 1024, etc.)"
  type        = string
  default     = "256"
  # 256 = 0.25 vCPU, suffisant pour WordPress dev
}

variable "memory" {
  description = "Mémoire pour les containers (512, 1024, 2048, etc.)"
  type        = string
  default     = "512"
  # 512 MB suffisant pour WordPress dev
}

variable "desired_count" {
  description = "Nombre de containers WordPress à lancer"
  type        = number
  default     = 1
  # 1 container pour dev, 2+ pour prod
}

# Configuration WordPress
variable "wordpress_image" {
  description = "Image Docker WordPress à utiliser"
  type        = string
  default     = "wordpress:6.4-apache"
  # Image officielle WordPress avec Apache
}

# Configuration base de données
variable "database_endpoint" {
  description = "Endpoint de la base de données RDS"
  type        = string
}

variable "database_name" {
  description = "Nom de la base de données"
  type        = string
  default     = "wordpress"
}

variable "database_username" {
  description = "Nom d'utilisateur de la base de données"
  type        = string
  default     = "admin"
}

variable "database_password" {
  description = "Mot de passe de la base de données"
  type        = string
  sensitive   = true
  # sensitive = true masque la valeur dans les logs
}