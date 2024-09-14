# Implantando uma Aplicação Containerizada na AWS com Terraform

Este projeto demonstra como implantar uma aplicação containerizada na AWS usando Terraform, como parte de um estudo em Infraestrutura como Código (IaC) e computação em nuvem.

## Sobre o Projeto

Este projeto foi desenvolvido como parte da pós-graduação em Engenharia de Dados na Data Science Academy. Ele representa a aplicação prática dos conhecimentos adquiridos em Infraestrutura como Código (IaC) e computação em nuvem.

## Principais Características

- Configuração completa de infraestrutura AWS
- Implantação de cluster ECS Fargate
- Rede segura com VPC personalizada
- Aplicação prática de princípios DevOps

## Pré-requisitos

- Conta AWS
- Docker instalado
- Terraform instalado
- AWS CLI configurado

## Como Usar

1. Clone o repositório
2. Configure as credenciais AWS
3. Ajuste as variáveis no arquivo `terraform.tfvars`
4. Execute `terraform init`
5. Execute `terraform plan`
6. Execute `terraform apply`

Para instruções detalhadas, consulte o [tutorial completo](https://www.linkedin.com/pulse/tutorial-completo-implantando-uma-aplica%25C3%25A7%25C3%25A3o-na-aws-com-carlos-costa-lawtf).

## Componentes Principais

- VPC e Networking
- Grupos de Segurança
- ECS e Fargate
- Application Load Balancer

## Considerações de Segurança

- Grupos de segurança restritos
- Credenciais AWS gerenciadas fora do código
- Estado do Terraform armazenado de forma segura no S3
- VPC isolada

## Aprendizados e Desenvolvimento

Este projeto reflete a jornada de aprendizado na pós-graduação em Engenharia de Dados da Data Science Academy, aplicando princípios de arquitetura em nuvem e melhores práticas de DevOps.

## Próximos Passos

- Implementar um pipeline de CI/CD
- Explorar opções avançadas de monitoramento com CloudWatch
- Adicionar mais serviços AWS à infraestrutura

## Referências

- [Tutorial Completo no LinkedIn](https://www.linkedin.com/pulse/tutorial-completo-implantando-uma-aplica%25C3%25A7%25C3%25A3o-na-aws-com-carlos-costa-lawtf)
- [Postagem Original no LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7240432460927320064/)
- [Amazon ECS Developer Guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Data Science Academy - Pós-Graduação em Engenharia de Dados](https://www.datascienceacademy.com.br)
- [Docker - Get Started](https://www.docker.com/get-started)

## Autor

Carlos Costa - [Perfil LinkedIn](https://www.linkedin.com/in/carlos-costa-0b548675/)
