# infrastructure/modules/vpc/outputs.tf
# CERTIFICAT DE LIVRAISON - Infos importantes après construction

output "vpc_id" {
  description = "ID de ton VPC (réseau principal)"
  value       = aws_vpc.main.id
  # Ex: "vpc-1234567890abcdef0"
}

output "vpc_cidr_block" {
  description = "Adresse de ton réseau"
  value       = aws_vpc.main.cidr_block
  # Ex: "10.0.0.0/16"
}

output "public_subnet_ids" {
  description = "IDs des zones publiques"
  value       = aws_subnet.public[*].id
  # Ex: ["subnet-abc123", "subnet-def456"]
}

output "private_subnet_ids" {
  description = "IDs des zones privées"
  value       = aws_subnet.private[*].id
  # Ex: ["subnet-ghi789", "subnet-jkl012"]
}

output "database_subnet_ids" {
  description = "IDs des zones base de données"
  value       = aws_subnet.database[*].id
  # Ex: ["subnet-mno345", "subnet-pqr678"]
}

output "database_subnet_group_name" {
  description = "Nom du groupe base de données"
  value       = aws_db_subnet_group.main.name
  # Ex: "mon-coach-adapte-db-subnet-group"
}

output "internet_gateway_id" {
  description = "ID de la porte Internet"
  value       = aws_internet_gateway.main.id
  # Ex: "igw-1234567890abcdef0"
}

output "nat_gateway_ids" {
  description = "IDs des portes de sortie privées"
  value       = aws_nat_gateway.main[*].id
  # Ex: ["nat-1234567890abcdef0", "nat-0987654321fedcba0"]
}