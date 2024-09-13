# Projeto de Infraestrutura como Código (IaC) com Terraform e AWS

## Descrição do Projeto

Este projeto demonstra a implementação de Infraestrutura como Código (IaC) utilizando Terraform para provisionar e gerenciar recursos na Amazon Web Services (AWS). O foco principal é a criação de uma infraestrutura escalável e gerenciável para hospedar aplicações containerizadas usando Amazon ECS (Elastic Container Service).

## Tecnologias Utilizadas

- Terraform
- AWS (Amazon Web Services)
- Docker
- Amazon ECS (Elastic Container Service)
- Amazon VPC (Virtual Private Cloud)
- Application Load Balancer (ALB)
- CloudWatch

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- `Dockerfile`: Define o ambiente de desenvolvimento com Terraform e AWS CLI.
- `main.tf`: Arquivo principal do Terraform que define os recursos AWS.
- `variables.tf`: Declaração de variáveis utilizadas no projeto.
- `terraform.tfvars`: Valores específicos para as variáveis declaradas.
- `outputs.tf`: Define as saídas após a aplicação do Terraform.
- `providers.tf`: Configuração do provider AWS.
- `security_group.tf`: Define os grupos de segurança para ECS e ALB.
- `vpc.tf`: Configuração da VPC utilizando um módulo Terraform.
- `vars.env`: Variáveis de ambiente para os containers ECS.

## Funcionalidades Principais

1. **Configuração de VPC**: Cria uma VPC personalizada com subnets públicas e privadas.
2. **Cluster ECS**: Provisiona um cluster ECS para hospedar containers.
3. **Application Load Balancer**: Configura um ALB para distribuir tráfego para os containers.
4. **Grupos de Segurança**: Define regras de segurança para controlar o tráfego de rede.
5. **CloudWatch Logs**: Configura logs para monitoramento dos containers.

## Como Usar

1. Clone este repositório:
   ```
   git clone [URL_DO_SEU_REPOSITÓRIO]
   ```

2. Navegue até o diretório do projeto:
   ```
   cd [NOME_DO_DIRETÓRIO]
   ```

3. Construa a imagem Docker para o ambiente de desenvolvimento:
   ```
   docker build -t iac-dev-image:v1 .
   ```

4. Execute o container Docker:
   ```
   docker run -dit --name iac-dev -v ./IaC:/iac iac-dev-image:v1 /bin/bash
   ```

5. Configure suas credenciais AWS (substitua com suas próprias credenciais):
   ```
   docker exec iac-dev aws configure
   ```

6. Inicialize o Terraform:
   ```
   docker exec iac-dev terraform init
   ```

7. Aplique a configuração Terraform:
   ```
   docker exec iac-dev terraform apply
   ```

## Considerações de Segurança

- Este projeto utiliza variáveis de ambiente para configurações sensíveis.
- Certifique-se de nunca commitar credenciais ou informações sensíveis diretamente no código.
- Utilize o AWS IAM para gerenciar permissões e acessos.

## Contribuições

Contribuições para melhorar este projeto são bem-vindas. Por favor, sinta-se à vontade para fazer um fork do repositório e submeter pull requests.

## Licença

[Insira aqui a licença escolhida para o seu projeto]

## Contato

[Seu Nome] - [Seu Email]

Link do Projeto: [URL_DO_SEU_REPOSITÓRIO_GITHUB]# terraform-aws-ecs-infra
# terraform-aws-ecs-infra
