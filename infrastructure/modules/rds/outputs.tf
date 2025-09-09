# infrastructure/modules/rds/outputs.tf
# OUTPUTS DU MODULE RDS SEULEMENT

output "db_endpoint" {
  description = "Endpoint de la base de données RDS"
  value       = aws_db_instance.main.endpoint
}

output "db_name" {
  description = "Nom de la base de données"
  value       = aws_db_instance.main.db_name
}

output "db_username" {
  description = "Nom d'utilisateur de la base de données"
  value       = aws_db_instance.main.username
}

output "db_password" {
  description = "Mot de passe de la base de données"
  value       = random_password.db_password.result
  sensitive   = true
}

output "db_security_group_id" {
  description = "ID du security group RDS"
  value       = aws_security_group.rds.id
}