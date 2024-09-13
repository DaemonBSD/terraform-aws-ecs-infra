# Definição dos outputs do Terraform
# Outputs são valores que são exibidos após a aplicação do Terraform
# e podem ser usados por outros módulos ou scripts

# Output para o hostname do Application Load Balancer
output "alb_hostname" {
  # O valor deste output é o nome DNS do ALB criado
  value       = aws_lb.main.dns_name
  # Descrição do que este output representa
  description = "Nome DNS do Application Load Balancer"
}

# Output para o nome do cluster ECS
output "ecs_cluster_name" {
  # O valor deste output é o nome do cluster ECS criado
  value       = aws_ecs_cluster.main.name
  # Descrição do que este output representa
  description = "Nome do cluster ECS"
}

# Output para o ID da VPC
output "vpc_id" {
  # O valor deste output é o ID da VPC criada pelo módulo VPC
  value       = module.vpc.vpc_id
  # Descrição do que este output representa
  description = "ID da VPC"
}