# Nome do projeto
project_name = "my-ecs-project"

# Ambiente de implantação
environment = "dev"

# Região AWS para implantação
aws_region = "us-west-2"

# Bloco CIDR para a VPC
vpc_cidr = "10.0.0.0/16"

# Blocos CIDR para subnets públicas
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

# Blocos CIDR para subnets privadas
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

# Zonas de disponibilidade para a implantação
availability_zones = ["us-west-2a", "us-west-2b"]

# Porta exposta pelo container
container_port = 80

# Unidades de CPU para a tarefa Fargate (1024 unidades = 1 vCPU)
cpu = "256"

# Memória para a tarefa Fargate (em MB)
memory = "512"

# Nome da imagem Docker a ser usada
docker_image_name = "nginx:latest"

# Número de instâncias da aplicação a serem executadas
app_count = 2

# Caminho para verificação de saúde do ALB
health_check_path = "/"

# ARN do arquivo de variáveis de ambiente no S3
s3_env_vars_file_arn = "arn:aws:s3:::your-bucket-name/path/to/env/file"