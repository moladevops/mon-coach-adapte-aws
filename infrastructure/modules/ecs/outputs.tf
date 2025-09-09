# infrastructure/modules/ecs/outputs.tf
# OUTPUTS DU MODULE ECS

# Informations ECS Cluster
output "cluster_id" {
  description = "ID du cluster ECS"
  value       = aws_ecs_cluster.main.id
}

output "cluster_name" {
  description = "Nom du cluster ECS"
  value       = aws_ecs_cluster.main.name
}

output "cluster_arn" {
  description = "ARN du cluster ECS"
  value       = aws_ecs_cluster.main.arn
}

# Informations ECS Service
output "service_name" {
  description = "Nom du service ECS WordPress"
  value       = aws_ecs_service.wordpress.name
}

# Informations Load Balancer
output "load_balancer_dns_name" {
  description = "DNS name du Load Balancer (URL du site)"
  value       = aws_lb.main.dns_name
}

output "load_balancer_zone_id" {
  description = "Zone ID du Load Balancer"
  value       = aws_lb.main.zone_id
}

output "load_balancer_arn" {
  description = "ARN du Load Balancer"
  value       = aws_lb.main.arn
}

# Informations Security Groups
output "ecs_security_group_id" {
  description = "ID du security group ECS tasks"
  value       = aws_security_group.ecs_tasks.id
}

output "alb_security_group_id" {
  description = "ID du security group Load Balancer"
  value       = aws_security_group.alb.id
}

# Informations Task Definition
output "task_definition_arn" {
  description = "ARN de la task definition WordPress"
  value       = aws_ecs_task_definition.wordpress.arn
}

# Informations CloudWatch
output "log_group_name" {
  description = "Nom du log group CloudWatch"
  value       = aws_cloudwatch_log_group.wordpress.name
}