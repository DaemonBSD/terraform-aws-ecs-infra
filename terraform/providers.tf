# Configuração do Terraform
terraform {
  # Especifica os provedores necessários para este projeto
  required_providers {
    # Configuração do provedor AWS
    aws = {
      # Fonte do provedor AWS no registro do Terraform
      source  = "hashicorp/aws"
      # Versão do provedor AWS a ser utilizada
      # O '~>' significa que aceitamos qualquer versão 4.x.x, mas não 5.x.x
      version = "~> 4.0"
    }
  }
}

# Configuração do provedor AWS
provider "aws" {
  # A região AWS onde os recursos serão criados
  # Este valor é obtido da variável 'aws_region' definida em outro lugar
  region = var.aws_region
}