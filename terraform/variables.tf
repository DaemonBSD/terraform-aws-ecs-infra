# Definição das variáveis utilizadas no projeto Terraform

# Nome do projeto
variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

# Ambiente de implantação
variable "environment" {
  description = "Ambiente de implantação (ex: dev, staging, prod)"
  type        = string
}

# Região AWS
variable "aws_region" {
  description = "Região AWS para implantar os recursos"
  type        = string
}

# Bloco CIDR da VPC
variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC"
  type        = string
}

# CIDRs das subnets públicas
variable "public_subnet_cidrs" {
  description = "Blocos CIDR para as subnets públicas"
  type        = list(string)
}

# CIDRs das subnets privadas
variable "private_subnet_cidrs" {
  description = "Blocos CIDR para as subnets privadas"
  type        = list(string)
}

# Zonas de disponibilidade
variable "availability_zones" {
  description = "Lista de zonas de disponibilidade"
  type        = list(string)
}

# Porta do container
variable "container_port" {
  description = "Porta exposta pela imagem docker"
  type        = number
}

# CPU para Fargate
variable "cpu" {
  description = "Unidades de CPU para provisionar na instância Fargate"
  type        = string
}

# Memória para Fargate
variable "memory" {
  description = "Quantidade de memória para provisionar na instância Fargate (em MiB)"
  type        = string
}

# Imagem Docker
variable "docker_image_name" {
  description = "Imagem Docker para executar no cluster ECS"
  type        = string
}

# Número de instâncias da aplicação
variable "app_count" {
  description = "Número de containers Docker para executar"
  type        = number
}

# Caminho de verificação de saúde
variable "health_check_path" {
  description = "Caminho para verificação de saúde no target group padrão"
  type        = string
  default     = "/"
}

# ARN do arquivo de variáveis de ambiente no S3
variable "s3_env_vars_file_arn" {
  description = "ARN do objeto S3 contendo variáveis de ambiente"
  type        = string
}