# infrastructure/modules/vpc/versions.tf
# Spécifie quelles versions d'outils utiliser

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}