# infrastructure/modules/vpc/variables.tf
# FORMULAIRE DE COMMANDE pour ton VPC

variable "project_name" {
  description = "Nom de ton projet"
  type        = string
  # Ex: "mon-coach-adapte"
}

variable "environment" {
  description = "Environnement (dev, staging, prod)"
  type        = string
  # Ex: "dev"
}

variable "vpc_cidr" {
  description = "Taille de ton réseau AWS"
  type        = string
  default     = "10.0.0.0/16"
  # 10.0.0.0/16 = réseau avec 65,000 adresses IP
}

variable "public_subnet_cidrs" {
  description = "Adresses pour zone publique"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  # Zone publique = pour load balancers
}

variable "private_subnet_cidrs" {
  description = "Adresses pour zone privée"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
  # Zone privée = pour tes applications
}

variable "database_subnet_cidrs" {
  description = "Adresses pour zone base de données"
  type        = list(string)
  default     = ["10.0.20.0/24", "10.0.21.0/24"]
  # Zone DB = pour tes bases de données
}