# Módulo VPC da AWS
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  # Nome da VPC, combinando o nome do projeto e o ambiente
  name = "${var.project_name}-${var.environment}-vpc"
  
  # Bloco CIDR para a VPC
  cidr = var.vpc_cidr

  # Zonas de disponibilidade e subnets
  azs             = var.availability_zones
  private_subnets = var.private_subnet_cidrs
  public_subnets  = var.public_subnet_cidrs

  # Habilita NAT Gateway para permitir que instâncias em subnets privadas acessem a internet
  enable_nat_gateway = true
  # Usa um único NAT Gateway para todas as subnets privadas (mais econômico, mas menos resiliente)
  single_nat_gateway = true

  # Tags para identificar recursos relacionados a este projeto
  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}